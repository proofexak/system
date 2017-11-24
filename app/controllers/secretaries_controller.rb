class SecretariesController < ApplicationController
  before_action :set_secretary, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @secretary = @user.secretary
    if @secretary == nil
      redirect_to new_secretary_path
    else
      redirect_to edit_secretary_path(@secretary)
    end
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
    @value = params[:form]
  end

  private
    def set_secretary

    end

  
    def secretary_params
      params.require(:secretary).permit(:first_name, :last_name, :telephone_number)
    end
end
