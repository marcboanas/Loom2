class AddDatePassedToStudent < ActiveRecord::Migration
  def change
    add_column :students, :date_passed, :date
  end
end
