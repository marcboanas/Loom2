class RemoveCurrentFromStudent < ActiveRecord::Migration
  def up
    remove_column :students, :current
  end

  def down
    add_column :students, :current, :boolean
  end
end
