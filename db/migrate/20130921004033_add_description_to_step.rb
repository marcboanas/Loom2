class AddDescriptionToStep < ActiveRecord::Migration
  def change
    add_column :steps, :description, :text
  end
end
