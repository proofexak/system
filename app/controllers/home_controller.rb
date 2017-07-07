class HomeController < ApplicationController
  def index
  	@user = current_user
  	if @user != nil
  		redirect_to home_system_path
  	end
  end

  def system
  	@user = current_user
  	@customer = @user.customer_info
  end

end
