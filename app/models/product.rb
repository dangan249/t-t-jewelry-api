class Product < ActiveRecord::Base

	include WithNameLike

	attr_accessible :name, :price, :gender, :brand, :category

	validates_presence_of :name, :price, :gender, :brand, :category
	has_many :property_values, dependent: :destroy, inverse_of: :product

	belongs_to :brand, inverse_of: :products
	belongs_to :category, inverse_of: :products
end
