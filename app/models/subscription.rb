class Subscription < ActiveRecord::Base
    attr_accessible :plan_id, :stripe_card_token, :email, :user_id, :failed_payment
    belongs_to :plan
    belongs_to :user
    validates_presence_of :plan_id
    validates_presence_of :email
    
    attr_accessor :stripe_card_token, :coupon
    before_save :update_stripe
    
    def update_plan(plan)
        self.plan_id = []
        self.plan_id = plan.id
        unless stripe_id.nil?
            customer = Stripe::Customer.retrieve(stripe_id)
            customer.update_subscription(:plan => plan.id)
        end
        true
        rescue Stripe::StripeError => e
        logger.error "Stripe Error: " + e.message
        errors.add :base, "Unable to update your subscription. #{e.message}."
        false
    end
    
    def update_stripe
        if stripe_id.nil?
            if !stripe_card_token.present?
                raise "Stripe token not present. Can't create account."
            end
            if coupon.blank?
                customer = Stripe::Customer.create(
                                                   :email => email,
                                                   :description => email,
                                                   :card => stripe_card_token,
                                                   :plan => plan_id
                                                   )
                else
                customer = Stripe::Customer.create(
                                                   :email => email,
                                                   :description => email,
                                                   :card => stripe_card_token,
                                                   :plan => plan_id,
                                                   :coupon => coupon
                                                   )
            end
            else
            customer = Stripe::Customer.retrieve(stripe_id)
            if stripe_card_token.present?
                customer.card = stripe_card_token
            end
            customer.email = email
            customer.description = email
            customer.save
        end
        self.last_4_digits = customer.cards.data.first["last4"]
        self.stripe_id = customer.id
        self.stripe_card_token = nil
        rescue Stripe::StripeError => e
        logger.error "Stripe Error: " + e.message
        errors.add :base, "#{e.message}."
        self.stripe_card_token = nil
        false
    end
    
    def expire
        self.failed_payment = true
        self.save
    end
    def payment_success(customer)
        self.failed_payment = false
        self.email = customer.id
        self.save
    end
end