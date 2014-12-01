class ProductsController < ApplicationController
	def index

		products = Product.where(nil)
		meta = {}
		if(params[:category].present?)
			products = products.where(category_id: Category.find_by_name(params[:category]).id)
			meta[:brands] = Category.find_by_name(params[:category]).brands.pluck(:name)
		end

		if(params[:gender].present?)
			products = products.where(gender: params[:gender])
		end

		if(params[:brand].present?)
			products = products.where(brand_id: Brand.find_by_name(params[:brand]).id)
		end

		products = products.with_name_like(params[:query]).page(params[:page]).per(params[:per_page])
		meta[:total_pages] = products.total_pages
		respond_with(products, meta: meta)
	end
end
