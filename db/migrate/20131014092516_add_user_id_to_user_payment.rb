class AddUserIdToUserPayment < ActiveRecord::Migration
  def change
    add_column :user_payments, :user_id, :integer
  end
end
