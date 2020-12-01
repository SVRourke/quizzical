module ApplicationHelper
    def current_user
        @user ||= User.find(session[:user_id])
    end

    def logged_in?
        !!session[:user_id]
    end

end
