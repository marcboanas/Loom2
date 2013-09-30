class Expense < ActiveRecord::Base
    attr_accessible :asset_life, :dated, :description, :expense_type_id, :user_id, :value, :private_use
    belongs_to :user
end
