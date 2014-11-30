namespace :db do

	IMAGE_SIZE = 'w_185,h_185'
	desc "Clean up"
	task :clean_up => :environment do
		[Product, Property, PropertyValue].each(&:delete_all)
	end

	desc "populate database with rolex watches"
	task :populate_rolex => :environment do
		require 'populator'
		require 'faker'

		rolexes = %W(http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_18_gdst78.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_19_ugsyb2.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_ii4wqu.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_16_ndlkjz.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_17_ax5pjd.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_14_uvvqlt.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_15_bui9qr.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_13_xhtooy.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_12_lkfr2q.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_11_yknpsz.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_9_swk4ud.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_10_jcfztw.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_8_yov1uf.jpg
http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417281605/download_7_awspg8.jpg
)
		count = 0
		Product.populate 14 do |product|
			product.name = Populator.words(1..1).titleize
			product.brand = "Rolex"

			product.price = 500..1000
			product.gender = ['male', 'female']
			product.category = 'watch'
			product.image_url = rolexes[count]
			count += 1

			prop_count = 0
			Property.populate(5) do |property|
				property.name = Faker::Company.name
				if prop_count != 0
					SimpleValue.populate(1) do |simple_value|
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
				prop_count += 1
			end
		end
	end

	desc "populate database with seiko watches"
	task :populate_seiko => :environment do
		require 'populator'
		require 'faker'

		seikos = %W(http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282385/SRQ011_iotm4d.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282381/SRQ017_ii13hj.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282381/SSD001_jxkp3n.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282381/SPB021_jtumh1.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282381/SPB015_lu6rng.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282381/SPS007_iluzpk.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282381/SRQ003_vbycdo.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282381/SRQ015_tvsryn.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282380/SRQ005_d2ie58.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282380/SPB027_m63agt.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282380/SPB019_pml642.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282380/SPB017_c94kgo.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282380/SDGZ003_wvphqp.jpg http://res.cloudinary.com/andang-info/image/upload/#{IMAGE_SIZE}/v1417282380/SDGZ001_vxiwfp.jpg)
		count = 0
		Product.populate 14 do |product|
			product.name = Populator.words(1..1).titleize
			product.brand = "Seiko"

			product.price = 500..1000
			product.gender = ['male', 'female']
			product.category = 'watch'
			product.image_url = seikos[count]
			count += 1

			prop_count = 0
			Property.populate(5) do |property|
				property.name = Faker::Company.name
				prop_count += 1
				if prop_count != 0
					SimpleValue.populate(1) do |simple_value|
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
