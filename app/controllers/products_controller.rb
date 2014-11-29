class ProductsController < ApplicationController
	def index
		products = Product.includes(:property_values).paginate(:page => params[:page], :per_page => 10)
		respond_with(products, meta: { current_page: products.current_page,
		                               per_page: products.per_page,
		                               total_entries: products.total_entries
		                     })
	end
end
