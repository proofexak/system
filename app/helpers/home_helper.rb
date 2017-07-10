module HomeHelper


	def first_name?(user)
		if user == nil
			""
		else
			user.first_name
		end
	end

	def last_name?(user)
		if user == nil
			""
		else
			user.last_name
		end
	end

end
