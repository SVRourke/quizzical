class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to dashboards_path
    else
      flash[:alert] = @user.errors.messages
      
      redirect_back fallback_location: new_user_path()
    end
  end

  def edit
  end

  def update
  end

  def destroy
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
