class CustomersController < ApplicationController


  def index
    @user = current_user
    @customer = @user.customer
    if @customer
      redirect_to edit_customer_path(@customer)
    else
      redirect_to new_customer_path
    end
  end

  def show
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

  private
    def set_customer
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :telephone_number, 
        :city, :pesel)
    end
end
