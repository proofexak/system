class HomeController < ApplicationController
  def index
  	@user = current_user
    if @user
      @customer = @user.customer_info
    end

    if @user.try(:admin?)
      redirect_to home_system_path
    end
  end

  def system
  	@user = current_user
  	@customer = @user.customer_info

  end

  def make_admin
    @user = User.find(params[:id])
    if current_user.try(:admin?)
      @user.update_attribute :admin, true
    end
    if @user.save
      redirect_to home_user_list_path
    end
  end

  def revoke_admin
    @user = User.find(params[:id])
    if current_user.try(:admin?)
      @user.update_attribute :admin, false
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
