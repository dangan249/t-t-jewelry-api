class Category < ActiveRecord::Base
	attr_accessible :name
	has_many :brands, inverse_of: :category
	has_many :products, inverse_of: :category
end
