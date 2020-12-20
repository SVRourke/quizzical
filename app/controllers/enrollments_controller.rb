class EnrollmentsController < ApplicationController
    before_action :unauthorized_redirect
    after_action :verify_authorized

    def create
        authorize :enrollment, :create?
        if !current_user.enrolled_classes.exists?(params[:group_id])
            current_user.enrolled_classes << Group.find(params[:group_id])
            redirect_to dashboards_path and return
        end

        flash.notice = ["You are already in that class"]
        redirect_back fallback_location: groups_path() 
    end

    def destroy
        authorize :enrollment, :destroy?
        current_user.enrolled_classes.delete(Group.find(params[:id]))
        redirect_to dashboards_path()
    end

end