class AddYearToTaxReturn < ActiveRecord::Migration
  def change
    add_column :tax_returns, :year, :integer
  end
end
