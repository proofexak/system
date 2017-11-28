module WorkingHoursHelper


	def new_or_edit_wh?(employee, hour_id, path)
		if path == "new"
			employee_working_hours_path(employee)
		elsif path == "edit"
			employee_working_hour_path(employee, hour_id)
		end
	end

end
