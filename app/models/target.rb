class Target < ActiveRecord::Base
  attr_accessible :targets, :user_id, :year
    belongs_to :user
    validates :year, presence: true, uniqueness: { :scope => [:user_id] }, length: { maximum: 4, minimum: 4 }
    has_paper_trail
    serialize :targets, Hash
end
