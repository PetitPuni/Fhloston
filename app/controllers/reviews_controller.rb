class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def new
    @planet = Planet.find(params[:planet_id])
    if Review.user_has_reservation_for_planet?(@user, @planet)
      @review = Review.new(planet: @planet)
      authorize @review
    else
      redirect_to @planet, alert: "You can't leave a review for this planet without a reservation."
    end
  end

  def create
    @planet = Planet.find(params[:planet_id])
    booking = @planet.bookings.where(user: @user).first

    if booking.present?
      @review = Review.new(review_params)
      @review.booking = booking
      authorize @review
      if @review.save
        redirect_to planet_path(@planet)
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to @planet, alert: "You can't leave a review for this planet without a reservation."
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update(review_params)
      redirect_to planet_path(@review.planet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to planet_path(@review.planet)
  end

  # ... other controller methods ...

  private

  def review_params
    params.require(:review).permit(:comment, :grade)
  end

  def set_user
    @user = current_user
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
