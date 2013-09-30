class AddAssetLifeFixedToExpenseType < ActiveRecord::Migration
  def change
    add_column :expense_types, :asset_life_fixed, :boolean
  end
end
