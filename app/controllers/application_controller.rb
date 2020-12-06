class ApplicationController < ActionController::Base
    include Pundit

    def current_user
        @user ||= User.find(session[:user_id])
    end

    def logged_in?
        session[:user_id].present? && current_user.id == session[:user_id]
    end
end
