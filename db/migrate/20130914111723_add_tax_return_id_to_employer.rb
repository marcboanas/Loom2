class AddTaxReturnIdToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :tax_return_id, :integer
  end
end
