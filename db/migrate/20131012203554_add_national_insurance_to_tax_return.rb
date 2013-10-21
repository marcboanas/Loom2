class AddNationalInsuranceToTaxReturn < ActiveRecord::Migration
  def change
    add_column :tax_returns, :national_insurance, :float
  end
end
