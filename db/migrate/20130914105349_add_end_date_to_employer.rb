class AddEndDateToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :end_date, :date
  end
end
