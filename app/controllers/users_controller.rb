class UsersController < ApplicationController
  def new
  end

  def create
    if user_params[:password] == user_params[:password_confirmation] && user_params[:password_confirmation] != nil && !user_params[:password].empty? && !user_params[:name].empty?
      @user = User.create(user_params)
      session[:password] = @user.password
      session[:user_id] = @user.id
      session[:name] = @user.name
      redirect_to "/users#welcome"
    else
      redirect_to users_new_path
    end
  end

  def welcome
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :id)
  end
end
