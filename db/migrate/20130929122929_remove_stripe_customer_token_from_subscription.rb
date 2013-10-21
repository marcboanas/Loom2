class RemoveStripeCustomerTokenFromSubscription < ActiveRecord::Migration
  def up
    remove_column :subscriptions, :stripe_customer_token
  end

  def down
    add_column :subscriptions, :stripe_customer_token, :string
  end
end
