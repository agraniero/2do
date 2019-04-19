class UsersController < ApplicationController
  
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    #raise params
    redirect_to lists_path
  end
 
  private
 
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
