class AddSaleValueToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :sale_value, :float
  end
end
