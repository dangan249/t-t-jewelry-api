class Property < ActiveRecord::Base
	has_many :property_values, inverse_of: :property
end
