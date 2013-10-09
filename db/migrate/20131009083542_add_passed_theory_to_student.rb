class AddPassedTheoryToStudent < ActiveRecord::Migration
  def change
    add_column :students, :passed_theory, :boolean
  end
end
