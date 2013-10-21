class ExpenseCategory < ActiveRecord::Base
    attr_accessible :category, :expense_types_attributes
    has_many :expense_types
    accepts_nested_attributes_for :expense_types, :allow_destroy => true
end
