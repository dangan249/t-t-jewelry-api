class SimpleValue < PropertyValue
	attr_accessible value

	belongs_to :list_value, inverse_of: :simple_values, class_name: ListValue
end
