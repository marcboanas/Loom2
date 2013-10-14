class UserPayment < ActiveRecord::Base
    attr_accessible :payment_history, :user_id
    belongs_to :user
    
    serialize :payment_history
    
end
