class AddDatePassedPracticalToStudent < ActiveRecord::Migration
  def change
    add_column :students, :date_passed_practical, :date
  end
end
