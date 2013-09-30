class AddRegisteredSelfemployedToUser < ActiveRecord::Migration
  def change
    add_column :users, :registered_selfemployed, :boolean
  end
end
