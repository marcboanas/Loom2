class RemovePassedFromStudent < ActiveRecord::Migration
  def up
    remove_column :students, :passed
  end

  def down
    add_column :students, :passed, :boolean
  end
end
