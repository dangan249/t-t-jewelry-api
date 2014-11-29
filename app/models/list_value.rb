class ListValue < PropertyValue
	has_many :simple_values, class_name: "SimpleValue",
			foreign_key: "list_id"
end
