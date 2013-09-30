class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.date :date
      t.boolean :test
      t.text :description
      t.float :value
      t.integer :student_id

      t.timestamps
    end
  end
end
