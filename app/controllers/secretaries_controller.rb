class SecretariesController < ApplicationController
  before_action :set_secretary, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_secretary

  def index
    @user = current_user
    @secretary = @user.secretary
  end


  def show
  end

 
  def new
    @secretary = current_user.build_secretary
  end

  def edit
    @secretary = current_user.secretary
  end


  def create
    @secretary = current_user.build_secretary(secretary_params)
    if @secretary.save
      redirect_to root_path, notice: "Created"
    else
      render :new
    end
  end

  
  def update
    @secretary = current_user.secretary
    if @secretary.update(secretary_params)
      redirect_to root_path, notice: "Updated"
    else
      render :edit
    end
  end

  
  def destroy
    
  end

  def appointments
    @appointments = Appointment.all
    @status = params[:form]
  end

  private
    def set_secretary

    end

    def authenticate_secretary
      redirect_to root_path, notice: "You're not secretary" unless current_user.secretary? || current_user.admin?
    end
  
    def secretary_params
      params.require(:secretary).permit(:first_name, :last_name, :telephone_number)
    end
end
