class AddFailedPaymentToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :failed_payment, :boolean
  end
end
