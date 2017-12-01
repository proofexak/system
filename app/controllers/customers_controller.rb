class CustomersController < ApplicationController
  before_action :authenticate_customer

  def index
    @user = current_user
    @customer = @user.customer
  end

  def show
    if current_user.admin?
      @admin = current_user
      @customer = Customer.find(params[:id])
      @user = User.find(@customer.user_id)
    else
      redirect_to root_path, notice: "You're not admin"
    end
  end

  def new
    @user = current_user
    @customer = @user.build_customer

  end

  def edit
    @user = current_user
    @customer = @user.customer
  end

  def create
    @user = current_user
    @customer = @user.build_customer(customer_params)
    if @customer.save
      redirect_to root_path, notice: 'Created'
    else
      render :new
    end
  end

  def update
    @user = current_user
    @customer = @user.customer

    if @customer.update(customer_params)
      redirect_to root_path, notice: 'Updated'
    else
      render :edit
    end
  end

  def destroy
  end

  def search
    @employee = Employee.all
    @user = current_user
    @customer = @user.customer
  end

  def show_employee
    @employees = Employee.all
    @employee = @employees.find(params[:form])
    @working_hours = @employee.working_hours
  end

  private
    def set_customer
    end

    def authenticate_customer
      redirect_to root_path, notice: "You're not customer" unless current_user.customer? || current_user.admin?
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :telephone_number, 
        :city, :pesel)
    end
end
