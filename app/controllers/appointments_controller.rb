class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  
  def index
   @user = current_user
   @appointments = @user.appointments
  end


  def show
  end

  
  def new
    @employee_id = params[:form]
    @user = current_user
    @customer = @user.customer
    @appointment = @user.appointments.build
  end


  def edit
  end

  
  def create
    @user = current_user
    @appointment = @user.appointments.build(appointment_params)
    if @appointment.save
      redirect_to root_path, notice: 'Appointment made, wait for acceptance'
    else
      render :new
    end
  end

  def update
  
  end


  def destroy
    
  end

  private
   
    def set_appointment
      
    end

   
    def appointment_params
      params.require(:appointment).permit(:purpose, :extra, :appointmentDate)
    end
end
