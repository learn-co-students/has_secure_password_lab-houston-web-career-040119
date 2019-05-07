class WelcomeController < ApplicationController

    def home
        @user = User.find(current_user) unless current_user.blank?
    end
end
