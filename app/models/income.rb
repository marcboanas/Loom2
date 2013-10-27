class Income < ActiveRecord::Base
    attr_accessible :date, :description, :student_id, :test, :value, :expense_id
    belongs_to :student
    belongs_to :expense
    
    after_destroy :undo_asset_sold
    after_save :asset_sold
    after_save { |income| income.destroy if income.value.blank? }
    
    validates :expense_id, :uniqueness => true, :if => :expense_id
    
    def asset_sold
        if self.expense_id
            self.expense.sold = true
            self.expense.save
        end
    end
    
    def undo_asset_sold
        if self.expense_id
            self.expense.sold = false
            self.expense.save
        end
    end
    
end