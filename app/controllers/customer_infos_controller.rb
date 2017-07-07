class CustomerInfosController < ApplicationController


  def index
    @user = current_user
    @customer = @user.customer_info
    if @customer == nil
      redirect_to new_customer_info_path
    else
      redirect_to edit_customer_info_path(@customer)
    end
  end

  def show
  end

  def new
    @user = current_user
    @customer = @user.build_customer_info

  end

  def edit
    @user = current_user
    @customer = @user.customer_info
  end

  def create
    @user = current_user
    @customer = @user.build_customer_info(customer_info_params)
    if @customer.save
      redirect_to home_system_path, notice: 'Created'
    else
      render :new
    end
  end

  def update
    @user = current_user
    @customer = @user.customer_info

    if @customer.update(customer_info_params)
      redirect_to home_system_path, notice: 'Updated'
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def set_customer_info
    end

    def customer_info_params
      params.require(:customer_info).permit(:first_name, :last_name, :telephone_number, 
        :city, :pesel)
    end
end
