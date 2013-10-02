class AddPaymentHistoryToUser < ActiveRecord::Migration
  def change
    add_column :users, :payment_history, :text
  end
end
