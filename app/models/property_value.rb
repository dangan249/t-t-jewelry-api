class PropertyValue < ActiveRecord::Base
	belongs_to :property, inverse_of: :property_values
	belongs_to :product, inverse_of: :property_values
end
