class Employer < ActiveRecord::Base
  attr_accessible :PAYE, :address, :director, :end_date, :income, :name, :start, :tax, :tax_return_id, :national_insurance
    belongs_to :tax_return
    serialize :address, Hash
end
