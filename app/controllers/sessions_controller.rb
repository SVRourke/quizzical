class SessionsController < ApplicationController
    def new
    end
    
    # REFACTOR FOR ERROR MESSAGES
    def create
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to dashboards_path and return
        end

        flash.notice = "Incorrect Login..."
        redirect_back fallback_location: :root
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def GoogleAuth
        5.times {puts "+"}
        # puts params[:teacher]
        puts request.env["omniauth.auth"]
        5.times {puts "+"}

        access_token = request.env["omniauth.auth"]
        # user = User.from_omniauth(access_token)
        # session[:user_id] = user.id
        # user.google_token = access_token.credentials.token
        # p user
        # user.save
    end

end