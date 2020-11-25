class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.valid? && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            # ADD REDIRECT TO USER DASHBOARD
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

end