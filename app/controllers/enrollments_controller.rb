class EnrollmentsController < ApplicationController
    def new
    end

    def create
        puts params
        if current_user.enrolled_classes.exists?(params[:group_id])
            # add an alert
            redirect_to groups_path
        else
            current_user.enrolled_classes << Group.find(params[:group_id])
            redirect_to dashboards_path
        end
    end

end