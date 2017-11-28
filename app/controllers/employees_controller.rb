class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @employee = @user.employee
    if !@employee
      redirect_to new_employee_path
    else
      redirect_to edit_employee_path(@employee)
    end
  end

  def show
  end


  def new
    @user = current_user
    @employee = @user.build_employee
  end

  def edit
    @user = current_user
    @employee = @user.employee
  end

  def create
    @user = current_user
    @employee = @user.build_employee(employee_params)
    if @employee.save
      redirect_to root_path, notice: 'Created'
    else
      render :new
    end
  end


  def update
    @user = current_user
    @employee = @user.employee
    if @employee.update(employee_params)
      redirect_to root_path, notice: 'Updated'
    else
      render :edit
    end
  end


  def destroy
    
  end

  def appointments
    @employee = current_user.employee
    @appointments = Appointment.all
  end


  private
    def set_employee
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :telephone_number, 
        :position)
    end
end
