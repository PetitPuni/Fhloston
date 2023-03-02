class UsersController < ApplicationController

  def show
  end

  def edit
  end

  def update
    current_user.update(params_user)
    redirect_to user_path(current_user)
  end

  private

  def params_user
    params.require(:user).permit(:photo, :username, :description)
  end
end
