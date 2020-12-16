class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to dashboards_path and return
        end
        
        flash.notice = ["Unable to log in with provided credentials..."]
        redirect_back fallback_location: :root
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def GoogleAuth
        if user = User.from_omniauth(auth, teacher_state)
            session[:user_id] = user.id
            redirect_to :dashboards and return
        end
    
        flash.notice << ['Error logging in...']
        render :new
    end
    
    private

    def teacher_state
        request.env['omniauth.params']['teacher']
    end
    
    def auth
        request.env['omniauth.auth']['info']
    end

end