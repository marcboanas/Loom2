class Income < ActiveRecord::Base
  attr_accessible :date, :description, :student_id, :test, :value
    belongs_to :student
    
    after_save { |income| income.destroy if income.value.blank? }
    
end
