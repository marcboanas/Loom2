class AddFixedAssetToExpenseType < ActiveRecord::Migration
  def change
    add_column :expense_types, :fixed_asset, :boolean
  end
end
