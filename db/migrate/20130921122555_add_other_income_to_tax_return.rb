class AddOtherIncomeToTaxReturn < ActiveRecord::Migration
  def change
    add_column :tax_returns, :other_income, :float
  end
end
