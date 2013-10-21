class AddPrivateUseToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :private_use, :integer
  end
end
