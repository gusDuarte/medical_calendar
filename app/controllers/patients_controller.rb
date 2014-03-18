class PatientsController < ApplicationController
  before_action :signed_in_user, only: [:index, :new, :edit, :update, :destroy]
  
  def edit
    @patient = Patient.find(params[:id])
  end 
  
  def index
    @patients = Patient.find_by_user(current_user).search(params[:search], current_user).paginate(page: params[:page])
  end
  
  def new
    @patient = Patient.new
  end

  def create 
    @mc     = current_user.medical_center
    @patient = @mc.patients.build(patient_params)
   
    if @patient.save
      flash[:notice] = _('New Patient created')
      redirect_to @patient
    else
      render 'new'
    end
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(patient_params)
      flash[:success] = "Profile updated"
      redirect_to @patient
    else
      render 'edit'
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end
end


private

  def patient_params
    params.require(:patient).permit(:name, :email, :phone_number)
  end
  
  
