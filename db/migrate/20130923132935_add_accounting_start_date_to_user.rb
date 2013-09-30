class AddAccountingStartDateToUser < ActiveRecord::Migration
  def change
    add_column :users, :accounting_start_date, :date
  end
end
