class Appointment < ActiveRecord::Base
	belongs_to :user
	belongs_to :employee
	belongs_to :customer

	validates :purpose, :extra, :appointment_date, :appointment_time, presence: true
	validates :appointment_time, uniqueness: {scope: [:employee_id, :appointment_date] } 

	
end
