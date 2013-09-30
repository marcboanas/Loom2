class AddEmployedToTaxReturn < ActiveRecord::Migration
  def change
    add_column :tax_returns, :employed, :boolean
  end
end
