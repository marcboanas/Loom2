class AddExpenseIdToIncome < ActiveRecord::Migration
  def change
    add_column :incomes, :expense_id, :integer
  end
end
