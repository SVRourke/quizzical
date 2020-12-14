class GroupsController < ApplicationController
    before_action :unauthorized_redirect
    after_action :verify_authorized

    def index
        authorize Group, :index?
        @groups = Group.all
    end

    def show
        @group= Group.find(params[:id])
        authorize @group
        render :teacher_view_group and return if current_user.teacher
    end

    def new
        authorize Group, :new?
        @group = Group.new
    end

    def create
        authorize Group, :create?
        @group = Group.new(group_params.merge({teacher: current_user}))
        redirect_to group_path(@group) and return if @group.save()
        render :new
    end

    def destroy
    end

    private

    def group_params
        params.require(:group).permit(:name)
    end
    
end