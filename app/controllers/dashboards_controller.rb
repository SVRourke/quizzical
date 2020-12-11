class DashboardsController < ApplicationController
    before_action :unauthorized_redirect
    def show
        @user = current_user

        if @user.teacher?
            render :teacher and return
        end

        render :student
    end

end