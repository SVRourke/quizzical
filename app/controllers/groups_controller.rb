class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end

    def show
        @group= Group.find(params[:id])
    end

    def new
    end

    def create
        @group = Group.create(group_params)
        @group.teacher = current_user
        redirect_to group_path(@group)
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def group_params
        params.require(:group).permit(:name, :teacher)
    end
    
end