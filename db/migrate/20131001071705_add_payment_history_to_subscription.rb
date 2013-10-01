class AddPaymentHistoryToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :payment_history, :text
  end
end
