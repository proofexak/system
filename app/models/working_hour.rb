class WorkingHour < ActiveRecord::Base
	belongs_to :employee

	validates :day, :start_hour, :end_hour, presence: true
	validates :day, uniqueness: {message: ": You already set working hours for %{value}"}

end
