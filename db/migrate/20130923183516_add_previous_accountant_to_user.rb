class AddPreviousAccountantToUser < ActiveRecord::Migration
  def change
    add_column :users, :previous_accountant, :boolean
  end
end
