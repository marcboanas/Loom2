class AddSalePriceToExpenseType < ActiveRecord::Migration
  def change
    add_column :expense_types, :sale_price, :float
  end
end
