class AddDefaultYearToUser < ActiveRecord::Migration
  def change
    add_column :users, :default_year, :integer
  end
end
