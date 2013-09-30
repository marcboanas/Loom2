class AddBusinessTypeIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :business_type_id, :integer
  end
end
