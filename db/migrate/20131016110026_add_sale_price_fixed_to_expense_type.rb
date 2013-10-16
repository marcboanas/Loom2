class AddSalePriceFixedToExpenseType < ActiveRecord::Migration
  def change
    add_column :expense_types, :sale_price_fixed, :boolean
  end
end
