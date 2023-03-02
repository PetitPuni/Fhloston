class UsersController < ApplicationController
  before_action :authorize_user

  def show
  end

  def edit
  end

  def update
    current_user.update(params_user)
    authorize current_user
    redirect_to user_path(current_user)
  end

  private

  def params_user
    params.require(:user).permit(:photo, :username, :description)
  end

  def authorize_user
    authorize current_user
  end
end
