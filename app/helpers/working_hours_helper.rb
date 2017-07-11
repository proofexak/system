module WorkingHoursHelper

	def correct_lp(hour)
		if hour.day == "monday"
			hour.lp = 1
		elsif hour.day == "tuesday"
			hour.update_attribute :lp, 2
		elsif hour.day == "wednesday"
			hour.update_attribute :lp, 3
		elsif hour.day == "thursday"
			hour.update_attribute :lp, 4
		elsif hour.day == "friday"
			hour.update_attribute :lp, 5
		end
	end


end
