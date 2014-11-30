class Category < ActiveRecord::Base
	has_many :brands, inverse_of: :category
end
