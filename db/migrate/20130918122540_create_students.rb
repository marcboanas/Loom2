class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :home_phone
      t.string :mobile
      t.integer :user_id
      t.boolean :current
      t.boolean :passed

      t.timestamps
    end
  end
end
