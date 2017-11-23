module AppointmentsHelper
	

	def newOrEditt?(path, employee_id, appointment_id)
		if path == "new"
			employee_appointments_path(employee_id)
		elsif path == "edit"
			employee_appointment_path(employee_id, appointment_id)
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
