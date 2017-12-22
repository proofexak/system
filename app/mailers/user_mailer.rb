class UserMailer < ApplicationMailer
	default from: 'appointments@gmail.com'

	def accepted_appointment(customer)
		@customer = customer
		@user = User.find(@customer.user_id)
		@appointments = @user.appointments.includes(:employee)
		mail(to: @user.email, subject: 'Your appointment has beed accepted')
	end
end
