class CreateUserPayments < ActiveRecord::Migration
  def change
    create_table :user_payments do |t|
      t.text :payment_history

      t.timestamps
    end
  end
end
