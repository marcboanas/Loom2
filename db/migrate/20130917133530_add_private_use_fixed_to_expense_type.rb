class AddPrivateUseFixedToExpenseType < ActiveRecord::Migration
  def change
    add_column :expense_types, :private_use_fixed, :boolean
  end
end
