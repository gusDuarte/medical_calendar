class DoctorsController < ApplicationController
  before_action :signed_in_user, only: [:index, :new, :edit, :update, :destroy]
  
  def edit
    @doctor = Doctor.find(params[:id])
  end 
  
  def index
    @doctors = Doctor.find_by_user(current_user).search(params[:search], current_user).paginate(page: params[:page])
  end
  
  def new
    @doctor = Doctor.new
  end

  def create 
    @mc     = current_user.medical_center
    @doctor = @mc.doctors.build(doctor_params)
   
    if @doctor.save
      flash[:notice] = _('New Doctor created')
      redirect_to @doctor
    else
      render 'new'
    end
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update_attributes(doctor_params)
      flash[:success] = "Profile updated"
      redirect_to @doctor
    else
      render 'edit'
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
  end
end


private

  def doctor_params
    params.require(:doctor).permit(:name, :speciality, :email, :phone_number)
  end
  
  
