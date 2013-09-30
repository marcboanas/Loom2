class AddNextStepToUser < ActiveRecord::Migration
  def change
    add_column :users, :next_step, :integer
  end
end
