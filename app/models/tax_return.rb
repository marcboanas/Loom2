class TaxReturn < ActiveRecord::Base
    attr_accessible :UTR, :dividend, :interest, :loss, :pension, :user_id, :employers_attributes, :year, :employed, :other_income
    belongs_to :user
    has_many :employers, :dependent => :destroy
    accepts_nested_attributes_for :employers, :allow_destroy => true
    
    validates :year, presence: true, uniqueness: { :scope => [:user_id] }, length: { maximum: 4, minimum: 4 }
    has_paper_trail
end
