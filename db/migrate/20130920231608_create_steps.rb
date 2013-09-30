class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :step
      t.string :controller
      t.string :action
      t.string :variable

      t.timestamps
    end
  end
end
