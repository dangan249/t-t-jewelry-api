class ListValue < PropertyValue
	has_many :values, class_name: "SimpleValue", inverse_of: :list_value
end
