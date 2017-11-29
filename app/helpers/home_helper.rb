module HomeHelper


	def first_name?(user)
		if !user
			""
		else
			user.first_name
		end
	end

	def last_name?(user)
		if !user
			""
		else
			user.last_name
		end
	end

	def whos_name_to_show?(user)
		if user.employee?
			first_name?(user.employee)
		elsif user.secretary?
			first_name?(user.secretary)
		elsif user.customer?
			first_name?(user.customer)
		else
			"nieznane"
		end		
	end

	def whos_last_name_to_show?(user)
		if user.employee?
			last_name?(user.employee)
		elsif user.secretary?
			last_name?(user.secretary)
		elsif user.customer?
			last_name?(user.customer)
		else
			"nieznane"
		end		
	end

	def who_to_show?(user)
		if user.customer?
			customer_path(user.customer)
		elsif user.employee?
			employee_path(user.employee)
		elsif user.secretary?
			admin_user_user_list_path(user)
		elsif user.admin?
			admin_user_user_list_path(user)
		end	
	end

end
