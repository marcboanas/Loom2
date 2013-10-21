class RemoveTaxIdFromEmployer < ActiveRecord::Migration
  def up
    remove_column :employers, :tax_id
  end

  def down
    add_column :employers, :tax_id, :integer
  end
end
