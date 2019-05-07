class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: user_params[:name])
    if @user.try(:authenticate, user_params[:password])
      redirect_to "/users/#welcome"
      session[:user_id] = @user.id
    else
      redirect_to '/users#new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :id)
  end
end
