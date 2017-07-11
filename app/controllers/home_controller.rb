class HomeController < ApplicationController
  def index
  	@user = current_user
    if @user
      @customer = @user.customer_info
      @employee = @user.employee
    end

    if @user.try(:admin?)
      redirect_to home_system_path
    end
  end

  def system
  	@user = current_user
  	@customer = @user.customer_info

  end

  def change_user_type
    @user = User.find(params[:id])
    if current_user.try(:admin?)
      if params[:form] == "Admin"
        @user.update_attribute :admin, true
      else
        @user.update_attribute :admin, false
      end
      @user.update_attribute :type, params[:form]
    end
    if @user.save
      redirect_to home_user_list_path
    end
  end

  def user_list
    @users = User.all
  end

  def delete_user
    @user = User.find(params[:id])
    if current_user.try(:admin?)
      @user.destroy
      redirect_to home_user_list_path
    end
  end

end
