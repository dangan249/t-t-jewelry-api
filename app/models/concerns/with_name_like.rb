module WithNameLike
	extend ActiveSupport::Concern

	module ClassMethods
		def with_name_like(query)
			return where(nil) if query.blank?
			self.where("LOWER(name) LIKE LOWER(?) AND LOWER((name)) != LOWER(?)",
							      "%#{query}%", query)
		end
	end
end
