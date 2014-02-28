class DoctorsController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  def index
    # @user = current_user
    # @medical_center = current_user.medical_center
    # @doctors = current_user.medical_center.doctors 
    @doctors = Doctor.where(medical_center_id = current_user.medical_center.id).paginate(page: params[:page])
    # @doctors = Doctor.first
  end
  
  def new
  end

  def show
  end
end
