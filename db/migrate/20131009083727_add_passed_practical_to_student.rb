class AddPassedPracticalToStudent < ActiveRecord::Migration
  def change
    add_column :students, :passed_practical, :boolean
  end
end
