class Appointment < ActiveRecord::Base
	belongs_to :user

	validates :purpose, :extra, :appointmentDate, :appointmentTime, presence: true
end
