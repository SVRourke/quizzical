class EnrollmentsController < ApplicationController
    before_action :unauthorized_redirect
    after_action :verify_authorized

    def new
        authorize enrollment, :new?
    end
    # REFACTOR FOR VALIDATION
    def create
        authorize :enrollment, :create?
        if current_user.enrolled_classes.exists?(params[:group_id])
            # add an alert
            redirect_to groups_path
        else
            current_user.enrolled_classes << Group.find(params[:group_id])
            redirect_to dashboards_path
        end
    end

end