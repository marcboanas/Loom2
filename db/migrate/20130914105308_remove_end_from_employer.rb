class RemoveEndFromEmployer < ActiveRecord::Migration
  def up
    remove_column :employers, :end
  end

  def down
    add_column :employers, :end, :date
  end
end
