namespace :db do
	desc "Erase and fill database"
	task :populate => :environment do
		require 'populator'
		require 'faker'

		[Product, Property, PropertyValue].each(&:delete_all)

		Product.populate 20 do |product|
			product.name = Populator.words(1..5).titleize
			product.brand = Populator.words(1..5).titleize

			product.price = 50..1000
			product.gender = ['male', 'female']
			product.category = ['watch', 'jewelry']

			Property.populate 5..10 do |property|

				property.name = Faker::Company.name
				if rand(100) % 2 == 0
					SimpleValue.populate 5..10 do |simple_value|
						simple_value.product_id = product.id
						simple_value.property_id = property.id
						simple_value.value = Populator.words(1..5).titleize
					end
				else

					ListValue.populate(1) do |list_value|
						list_value.product_id = product.id
						list_value.property_id = property.id
						SimpleValue.populate(2) do |simple_value|
							simple_value.value = Populator.words(1..5).titleize
							simple_value.list_value_id = list_value.id
						end
					end
				end

			end
		end
	end
end
