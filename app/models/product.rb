class Product < ActiveRecord::Base
	attr_accessible :name, :price, :gender, :brand, :category

	validates_presence_of :name, :price, :gender, :brand, :category
	has_many :property_values, dependent: :destroy, inverse_of: :product
end
