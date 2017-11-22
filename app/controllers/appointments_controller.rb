class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  
  def index
   @user = current_user
   @customer = @user.customer
   @appointments = @user.appointments
  end


  def show
  end

  
  def new
    @employee = Employee.find(params[:employee_id])
    @user = current_user
    @customer = @user.customer
    @appointment = @user.appointments.build
  end


  def edit
    @appointment = current_user.appointments.find(params[:id])
    @employee = Employee.find(params[:employee_id])
  end

  
  def create
    @user = current_user
    @employee = Employee.find(params[:employee_id])
    @appointment = @user.appointments.build(appointment_params)
    @appointment.customer_id = @user.customer.id
    @appointment.employee_id = @employee.id
    if @appointment.save
      redirect_to root_path, notice: 'Appointment made, wait for acceptance'
    else
      render :new
    end
  end

  def update
  
  end


  def destroy
    @user = current_user
    @appointment = @user.appointments.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  private
   
    def set_appointment
      
    end

   
    def appointment_params
      params.require(:appointment).permit(:purpose, :extra, :appointmentDate)
    end
end
