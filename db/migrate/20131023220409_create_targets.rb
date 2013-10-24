class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.integer :user_id
      t.text :targets
      t.integer :year

      t.timestamps
    end
  end
end
