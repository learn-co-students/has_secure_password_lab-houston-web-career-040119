class SessionsController < ApplicationController

    def new
    end

    def create  
        @user = User.find_by(name: params[:user][:name])
        @user = @user.try(:authenticate, params[:user][:password])
        return head(:forbidden) unless @user
        session[:user_id] = @user.id
    end
end
