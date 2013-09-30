class AddAssetLifeToExpenseType < ActiveRecord::Migration
  def change
    add_column :expense_types, :asset_life, :integer
  end
end
