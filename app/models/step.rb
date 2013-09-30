class Step < ActiveRecord::Base
    attr_accessible :action, :controller, :step, :variable, :business_type_ids, :description
    has_and_belongs_to_many :business_types
end
