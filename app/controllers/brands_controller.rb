class BrandsController < ApplicationController
	def index
		results = params[:category].present? ? Category.find_by_name(params[:category]).brands : Brand.all
		respond_with(results)
	end
end
