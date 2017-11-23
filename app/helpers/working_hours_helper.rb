module WorkingHoursHelper


	def newOrEdit?(path, employee, hour_id)
		if path == "new"
			employee_working_hours_path(employee)
		elsif path == "edit"
			employee_working_hour_path(employee, hour_id)
		end
	end

	def postOrPut?(value)
		if value == "post"
			:post
		elsif value == "put"
			:put
		end
	end


end
