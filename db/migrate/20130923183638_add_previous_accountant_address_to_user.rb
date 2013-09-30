class AddPreviousAccountantAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :previous_accountant_address, :text
  end
end
