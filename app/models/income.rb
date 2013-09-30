class Income < ActiveRecord::Base
  attr_accessible :date, :description, :student_id, :test, :value
    belongs_to :student
end
