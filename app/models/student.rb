class Student < ActiveRecord::Base
    attr_accessible :address, :current, :email, :home_phone, :mobile, :name, :passed_theory, :passed_practical, :user_id, :date_passed_theory, :date_passed_practical, :first_name, :last_name, :location, :street_number, :route, :locality, :postal_code, :referal
    
    attr_accessor :first_name, :last_name, :location, :street_number, :route, :locality, :postal_code
    
    before_save :name_hash
    
    before_save :address_hash

    belongs_to :user
    has_many :incomes
    serialize :address, Hash
    serialize :name, Hash
    
    def full_name
        self.name['first_name'] + ' ' + self.name['last_name']
    end
    
    def name_hash
        if first_name || last_name
        self.name = {"first_name" => self.first_name, "last_name" => self.last_name}
        end
    end
    def address_hash
        if location || street_number || route || locality || postal_code
            self.address = {"location" => self.location, "street_number" => self.street_number, "route" => self.route, "locality" => self.locality, "postal_code" => self.postal_code}
        end
    end
end
