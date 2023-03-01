class UsersController < ApplicationController
  rescue_from ActionController::InvalidAuthenticityToken, with: :handle_invalid_authenticity_token
  rescue_from ActiveStorage::IntegrityError, with: :handle_integrity_error

  def show
  end

  def edit
  end

  def update
    if current_user.update(params_user)
      redirect_to user_path(current_user)
    else
      flash.now[:error] = "Failed to update user"
      render :edit
    end
  end

  private

  def params_user
    params.require(:user).permit(:photo, :username, :description)
  end

  def handle_invalid_authenticity_token
    flash[:error] = "Stale request - please try again"
    redirect_back(fallback_location: root_path)
  end

  def handle_integrity_error
    flash[:error] = "Failed to upload file - please try again"
    redirect_back(fallback_location: root_path)
  end
end
