Stripe.api_key = "sk_0EOq8PuGP6lf0sjvzk0oE0Dwt9xuS"
STRIPE_PUBLIC_KEY = "pk_0EOqecMtXe4XG00WazpxoHMQEPaFb"

StripeEvent.setup do
    subscribe 'customer.subscription.deleted' do |event|
        user = User.find_by_stripe_id(event.data.object.customer)
        user.expire
    end
end