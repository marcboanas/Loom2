Stripe.api_key = "sk_0EOq8PuGP6lf0sjvzk0oE0Dwt9xuS"
STRIPE_PUBLIC_KEY = "pk_0EOqecMtXe4XG00WazpxoHMQEPaFb"

StripeEvent.setup do
    subscribe 'customer.subscription.deleted' do |event|
        subscription = Subscription.find_by_stripe_id(event.data.object.customer)
        subscription.expire
    end
    subscribe 'invoice.payment_succeeded' do |event|
        subscription = Subscription.find_by_stripe_id(event.data.object.customer)
        subscription.payment_success(event.data.object.customer)
    end
end