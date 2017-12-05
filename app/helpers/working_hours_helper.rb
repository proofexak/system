module WorkingHoursHelper


	def new_or_edit_wh?(men, hour_id, path)
		if path == "new"
			employee_working_hours_path(men)
		elsif path == "edit"
			employee_working_hour_path(employeee, hour_id)
		end
	end

end
