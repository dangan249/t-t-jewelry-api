class Property < ActiveRecord::Base
	attr_accessible :name
	has_many :property_values, inverse_of: :property
end
