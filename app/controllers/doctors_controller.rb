class DoctorsController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  def index
    @doctors = Doctor.where(medical_center_id = current_user.medical_center.id).search(params[:search]).paginate(page: params[:page])
  end
  
  def new
  end

  def show
  end
end
