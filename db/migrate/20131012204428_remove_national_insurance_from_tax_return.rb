class RemoveNationalInsuranceFromTaxReturn < ActiveRecord::Migration
  def up
    remove_column :tax_returns, :national_insurance
  end

  def down
    add_column :tax_returns, :national_insurance, :float
  end
end
