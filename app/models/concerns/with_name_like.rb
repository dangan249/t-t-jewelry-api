module WithNameLike
	extend ActiveSupport::Concern

	module ClassMethods
		def with_name_like(query)
			return where(nil) if query.blank?
			exact_match =
					self.select("1 AS order, *").
							where("LOWER(name) = LOWER(?)", query)

			pattern_match =
					self.select("2 AS order, *").
							where("LOWER(name) LIKE LOWER(?) AND LOWER((name)) != LOWER(?)",
							      "%#{query}%", query)

			from("(SELECT * FROM "\
           "(#{exact_match.to_sql} UNION ALL #{pattern_match.to_sql}) "\
         "AS foo ORDER BY foo.order) AS #{self.table_name}").order("#{self.table_name}.order")
		end
	end
end
