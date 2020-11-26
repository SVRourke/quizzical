class DashboardsController < ApplicationController
    def show
        @user = current_user
        if @user.teacher?
            render :teacher
        else
            render :student
        end
    end

end