class ExpenseType < ActiveRecord::Base
    attr_accessible :expense, :expense_category_id, :business_type_ids, :private_use, :private_use_fixed, :asset_life, :asset_life_fixed, :fixed_asset, :sale_price, :sale_price_fixed
    belongs_to :expense_categories
    has_and_belongs_to_many :business_types
end
