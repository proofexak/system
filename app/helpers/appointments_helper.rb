module AppointmentsHelper

	def wait_or_confirmed?(value)
		if value == "Waiting"
			false
		elsif value == "Confirmed"
			true
		end
	end


end
