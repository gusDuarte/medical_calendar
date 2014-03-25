class AppointmentsController < ApplicationController
  
  def show
    @doctor = Doctor.find(params[:id])
  end

  def index
    @doctor = Doctor.find(params[:doctor_id])
  end
end
