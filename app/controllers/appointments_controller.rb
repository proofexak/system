class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  
  def index
   @user = current_user
   @customer = @user.customer
   @appointments = @user.appointments.includes(:employee)
  end


  def show
    @appointment = Appointment.all.find(params[:id])
    @secretary = current_user.secretary
    @customer = Customer.find(@appointment.customer_id)
    @employee = Employee.find(@appointment.employee_id)
  end

  
  def new
    @employee = Employee.find(params[:employee_id])
    @user = current_user
    @customer = @user.customer
    @appointment = @user.appointments.build
    @path = "new"
    @test = [10, 20, 22]
  end


  def edit
    @appointment = current_user.appointments.find(params[:id])
    @employee = Employee.find(params[:employee_id])
    @path = "edit"
  end

  
  def create
    @user = current_user
    @customer = @user.customer
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
    @employee = Employee.find(params[:employee_id])
    @appointment = current_user.appointments.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: 'Appointment updated'
    else
      render :edit
    end
  end


  def destroy
    @appointment = Appointment.find(params[:id])
    @secretary = current_user.secretary
    @appointment.destroy
    if current_user.secretary?
      redirect_to secretary_appointments_path(@secretary)
    elsif current_user.customer
      redirect_to appointments_path
    end
  end

  def accept
    @secretary = current_user.secretary
    @appointment = Appointment.all.find(params[:appointment_id])
    @appointment.confirmation = true
    if @appointment.save
      redirect_to secretary_appointments_path(@secretary)
    else
      render :appointments
    end
  end

  private
   
    def set_appointment
      
    end

   
    def appointment_params
      params.require(:appointment).permit(:purpose, :extra, :appointment_date, :appointment_time)
    end
end
