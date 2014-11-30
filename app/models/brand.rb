class Brand < ActiveRecord::Base
	attr_accessible :name

	belongs_to :category, inverse_of: :brands
	has_many :products, inverse_of: :brand
end
