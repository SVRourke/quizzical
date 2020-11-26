class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end
    
    # maybe moved to enrollment controller??
    def submit_enrollment
        # can be refactored by scoping groups
        if current_user.enrolled_classes.exists?(params[:id])
            # add an alert
            redirect_to groups_path
        else
            current_user.enrolled_classes << Group.find(params[:id])
            redirect_to dashboards_path
        end
    end
end