class ProductsController < ApplicationController
	def index
		products = Product.includes(:property_values).page(params[:page]).per(params[:per_page])
		respond_with(products, meta: { total_pages: products.total_pages })
	end
end
