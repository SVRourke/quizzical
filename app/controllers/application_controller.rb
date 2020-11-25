class ApplicationController < ActionController::Base
    def current_user
        @user ||= User.find(session[:user_id])
    end
end
