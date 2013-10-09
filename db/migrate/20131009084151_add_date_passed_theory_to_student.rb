class AddDatePassedTheoryToStudent < ActiveRecord::Migration
  def change
    add_column :students, :date_passed_theory, :date
  end
end
