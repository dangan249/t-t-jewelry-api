class ProductsController < ApplicationController
	def index
		respond_with(Product.includes(:property_values).limit(10))
	end
end
