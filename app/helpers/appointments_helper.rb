module AppointmentsHelper
	

	def new_or_edit_a?(path, employee_id, appointment_id)
		if path == "new"
			employee_appointments_path(employee_id)
		elsif path == "edit"
			employee_appointment_path(employee_id, appointment_id)
		end
	end

	def post_or_put?(value)
		if value == "post"
			:post
		elsif value == "put"
			:put
		end
	end

	def wait_or_confirmed?(value)
		if value == "Waiting"
			false
		elsif value == "Confirmed"
			true
		end
	end


end
