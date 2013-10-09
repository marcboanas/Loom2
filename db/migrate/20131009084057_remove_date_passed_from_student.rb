class RemoveDatePassedFromStudent < ActiveRecord::Migration
  def up
    remove_column :students, :date_passed
  end

  def down
    add_column :students, :date_passed, :date
  end
end
