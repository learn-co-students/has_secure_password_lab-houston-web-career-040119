class WelcomeController < ApplicationController

  def welcome
    if !current_user_id
      redirect_to new_session_path
    else
      @username = User.find(current_user_id).name
    end
  end

end