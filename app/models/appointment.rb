class Appointment < ActiveRecord::Base
	belongs_to :user

	validates :purpose, :extra, :appointment_date, :appointment_time, presence: true
end
