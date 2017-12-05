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

  def new_date
    @employee = Employee.find(params[:employee])
    @user = current_user
    @customer = @user.customer
    @appointment = @user.appointments.build
  end


  def new
    @employee = Employee.find(params[:employee_id])
    @user = current_user
    @customer = @user.customer
    @appointment = @user.appointments.build(appointment_date_params)
    @path = "new"
    @working_hours = @employee.working_hours.where(lp: @appointment.appointment_date.wday).take
    @test = Array.new
    @hours = @working_hours.end_hour[0..1].to_f - @working_hours.start_hour[0..1].to_f
    if(@hours == 1) 
      @hours = @hours - 1 
    end
    for i in 0..@hours
      @test.push("#{sprintf('%g', @working_hours.start_hour[0..1].to_f+i)}:00") unless (@working_hours.start_hour[3..4] == '30' && i == 0)
      @test.push("#{sprintf('%g', @working_hours.start_hour[0..1].to_f+i)}:30") unless (@working_hours).end_hour[3..4] != '30' && i == @hours
    end
  end


  def edit
    @appointment = current_user.appointments.find(params[:id])
    @employee = Employee.find(params[:employee_id])
    @path = "edit"
    @working_hours = @employee.working_hours.where(lp: @appointment.appointment_date.wday).take
    @test = Array.new
    @hours = @working_hours.end_hour[0..1].to_f - @working_hours.start_hour[0..1].to_f
    if(@hours == 1) 
      @hours = @hours - 1 
    end
    for i in 0..@hours
      @test.push("#{sprintf('%g', @working_hours.start_hour[0..1].to_f+i)}:00") unless (@working_hours.start_hour[3..4] == '30' && i == 0)
      @test.push("#{sprintf('%g', @working_hours.start_hour[0..1].to_f+i)}:30") unless (@working_hours).end_hour[3..4] != '30' && i == @hours
    end
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

    def appointment_date_params
      params.require(:appointment).permit(:appointment_date)
    end
end
