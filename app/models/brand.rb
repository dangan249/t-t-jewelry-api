class Brand < ActiveRecord::Base
	belongs_to :category, inverse_of: :brands
end
