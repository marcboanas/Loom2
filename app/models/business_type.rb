class BusinessType < ActiveRecord::Base
    attr_accessible :business, :expense_type_ids, :step_ids
    has_many :users
    has_and_belongs_to_many :expense_types
    has_and_belongs_to_many :steps
end
