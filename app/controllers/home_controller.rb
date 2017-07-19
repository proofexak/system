class HomeController < ApplicationController
  def index
  	@user = current_user
    if @user
      @customer = @user.customer_info
      @employee = @user.employee
    end

    if @user.try(:type) == "admin"
      redirect_to admin_users_path
    end
  end

end
