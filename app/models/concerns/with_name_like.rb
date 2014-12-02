module WithNameLike
	extend ActiveSupport::Concern

	module ClassMethods
		def with_name_like(name)
			return where(nil) if name.blank?
			self.where("LOWER(name) LIKE LOWER(?)", "%#{name}%")
		end
	end
end
