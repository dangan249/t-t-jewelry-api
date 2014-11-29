class SimpleValue < PropertyValue

	attr_accessible :value
	validates_presence_of :value

	belongs_to :list_value, inverse_of: :values
end
