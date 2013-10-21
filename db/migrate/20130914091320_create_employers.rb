class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.integer :tax_id
      t.string :name
      t.string :PAYE
      t.text :address
      t.date :start
      t.date :end
      t.float :tax
      t.float :income
      t.boolean :director

      t.timestamps
    end
  end
end
