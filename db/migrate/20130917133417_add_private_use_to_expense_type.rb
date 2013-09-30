class AddPrivateUseToExpenseType < ActiveRecord::Migration
  def change
    add_column :expense_types, :private_use, :integer
  end
end
