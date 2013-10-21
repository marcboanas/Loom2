class Expense < ActiveRecord::Base
    attr_accessible :asset_life, :dated, :description, :expense_type_id, :user_id, :value, :private_use, :sale_value, :sold
    belongs_to :user
    belongs_to :expense_type
    has_many :incomes, :dependent => :destroy
    
    def short_description
        short_description = (!self.description.empty?) ? self.description : "no description"
        self.expense_type.expense + ": " + short_description
        end
end
