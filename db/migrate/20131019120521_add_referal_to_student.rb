class AddReferalToStudent < ActiveRecord::Migration
  def change
    add_column :students, :referal, :string
  end
end
