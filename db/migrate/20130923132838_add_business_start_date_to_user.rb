class AddBusinessStartDateToUser < ActiveRecord::Migration
  def change
    add_column :users, :business_start_date, :date
  end
end
