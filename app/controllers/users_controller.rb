class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @mc   = MedicalCenter.new
  end

  def create 
    # @user = User.new(params[:user])
    @mc = MedicalCenter.new(mc_params)
    @user = @mc.users.build(user_params)
    @user.rol = 'center_admin'
     
    if @mc.save
      sign_in @user
      flash[:notice] = "Welcome"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end


private

  def user_params
    params.require(:user).permit(:name, :email, :password, 
                                 :password_confirmation)
  end
  
  def mc_params
    params.require(:mc).permit(:name, :phone_number, :address)
  end
