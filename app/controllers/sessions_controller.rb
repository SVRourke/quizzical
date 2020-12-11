class SessionsController < ApplicationController
    def new
    end
    
    # REFACTOR FOR ERROR MESSAGES
    def create
        @user = User.find_by(email: params[:email])

        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to dashboards_path and return
        end

        redirect_back(fallback_location: root_path)
    end

    def destroy
        session.clear
        redirect_to root_path
    end

end