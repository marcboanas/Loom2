class AddNationalInsuranceToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :national_insurance, :float
  end
end
