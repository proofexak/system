class WorkingHour < ActiveRecord::Base
	belongs_to :employee

	validates :day, :start_hour, :end_hour, presence: true
	validates :day, uniqueness: {scope: :employee ,message: ": You already set working hours for %{value}"}
	#validate :correct_working_hours, on: :create

	#def correct?
	#	(start_hour.to_i - end_hour.to_i) > 0
	#end

	#def correct_working_hours
	#	errors.add(:start_hour, "is greater than", :end_hour) unless WorkingHour.correct?
		
	#end

	

end
