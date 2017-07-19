class WorkingHoursController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @employee = @user.employee
    @hours = @employee.working_hours
  end

  def show
  end


  def new
    @user = current_user
    @employee = @user.employee
    @hour = @employee.working_hours.new
  end

  def edit
  end


  def create
    @user = current_user
    @employee = @user.employee
    @hour = @employee.working_hours.new(working_hour_params)
    correct_lp(@hour)
    if @hour.save
      redirect_to employee_working_hours_path(@employee), notice: 'Added'
    else
      render :new
    end
  end

  def update
  end


  def destroy
    @user = current_user
    @employee = @user.employee
    @hour = @employee.working_hours.find(params[:id])
    @hour.destroy
    redirect_to employee_working_hours_path(@employee)
  end

  private
    def set_working_hour
    end

    def working_hour_params
      params.require(:working_hour).permit(:day, :start_hour, :end_hour)
    end


    def correct_lp(hour)
      if hour.day == "monday"
        hour.lp = 1
      elsif hour.day == "tuesday"
        hour.lp = 2
      elsif hour.day == "wednesday"
        hour.lp = 3
      elsif hour.day == "thursday"
        hour.lp = 4
      elsif hour.day == "friday"
        hour.lp = 5
      end
    end
end
