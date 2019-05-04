class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params["name"]
      @user = User.all.where(name: params["name"]).first&.authenticate(params["password"])
    else
      @user = User.where(params.require(:user).permit(:name)).first&.authenticate(params.require(:user).permit(:password)[:password])
    end

    if @user
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name,:password)
  end
end
