class UsersController < ApplicationController


  def create
    User.create(user_params)
    if user_params[:password] == user_params[:password_confirmation]
      session[:user_id] = User.last.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end


end
