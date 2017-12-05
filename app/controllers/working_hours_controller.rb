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
    @path = "new"
    @select_hours = Array.new
    for i in 0..12
      @select_hours.push("#{07+i}:00")
      @select_hours.push("#{07+i}:30")
    end
  end

  def edit
    @user = current_user
    @employee = @user.employee
    @hour = @employee.working_hours.find(params[:id])
    @path = "edit"
    @select_hours = Array.new
    for i in 0..12
      @select_hours.push("#{07+i}:00")
      @select_hours.push("#{07+i}:30")
    end
  end


  def create
    @user = current_user
    @employee = @user.employee
    @hour = @employee.working_hours.new(working_hour_params)
    @select_hours = Array.new
    for i in 0..12
      @select_hours.push("#{07+i}:00")
      @select_hours.push("#{07+i}:30")
    end
    correct_lp(@hour)
    if @hour.save
      redirect_to employee_working_hours_path(@employee), notice: 'Added'
    else
      render :new
    end
  end

  def update
    @employee = current_user.employee
    @hour = @employee.working_hours.find(params[:id])
    if @hour.update(working_hour_params)
      redirect_to employee_working_hours_path(@employee)
    end
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

    def correct?
      (start_hour.to_i - end_hour.to_i) > 0
    end

end
