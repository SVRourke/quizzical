class DashboardsController < ApplicationController
    before_action :unauthorized_redirect
    def show
        @user = current_user
        if @user.teacher?
            render :teacher
        else
            render :student
        end
    end

end