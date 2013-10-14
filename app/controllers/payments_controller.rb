class PaymentsController < ApplicationController
    def update_card
        @subscriptionCard = current_user.subscriptions.first
        @subscriptionCard.stripe_card_token = params[:subscription][:stripe_card_token]
        if @subscriptionCard.save
            redirect_to @subscriptionCard, :notice => 'Updated card.'
            else
            flash.alert = 'Unable to update card.'
            redirect_to edit_user_path(current_user)
        end
    end
    
    def payment_history
       @payments = UserPayment.first
    end
end
