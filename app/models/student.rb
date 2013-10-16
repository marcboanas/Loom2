class Student < ActiveRecord::Base
    attr_accessible :address, :current, :email, :home_phone, :mobile, :name, :passed_theory, :passed_practical, :user_id, :date_passed_theory, :date_passed_practical

    belongs_to :user
    has_many :incomes
    serialize :address, Hash
    serialize :name, Hash
    
    def full_name
       
        self.name['first_name'] + ' ' + self.name['last_name']
        
    end
end
