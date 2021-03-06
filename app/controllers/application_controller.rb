class ApplicationController < ActionController::Base
    include Pundit

    def unauthorized_redirect
        redirect_to :root if !logged_in?
    end

    def authorized_redirect
        redirect_to :dashboards if logged_in?
    end            

    def current_user
        @user ||= User.find(session[:user_id])
    end

    def logged_in?
        session[:user_id].present? && current_user.id == session[:user_id]
    end
end
