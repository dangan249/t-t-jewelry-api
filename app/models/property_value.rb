class PropertyValue < ActiveRecord::Base
	belongs_to :property, inverse_of: :property_values
end
