class Student < ActiveRecord::Base
    attr_accessible :address, :current, :email, :home_phone, :mobile, :name, :passed, :user_id, :date_passed
    belongs_to :user
    has_many :incomes
    serialize :address, Hash
    serialize :name, Hash
end
