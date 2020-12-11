class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # REFACTOR FOR VALIDATIONS
  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to dashboards_path and return
      end
    render :new
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :teacher
    )
  end
end
