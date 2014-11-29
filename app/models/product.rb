class Product < ActiveRecord::Base
	attr_accessible :name, :price, :gender, :brand, :category

	validates_presence_of :name, :price, :gender, :brand, :category
end
