class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :expense_type_id
      t.date :dated
      t.float :value
      t.text :description
      t.integer :asset_life
      t.integer :user_id

      t.timestamps
    end
  end
end
