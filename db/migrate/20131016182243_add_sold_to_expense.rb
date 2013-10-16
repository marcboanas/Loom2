class AddSoldToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :sold, :boolean
  end
end
