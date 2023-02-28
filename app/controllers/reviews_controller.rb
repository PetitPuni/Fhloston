class ReviewsController < ApplicationController
  before_action :set_user
  before_action :set_review, only: [:edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = @user
    @planet = Planet.find(params[:planet_id])
    if @review.save
      redirect_to planet_path(@planet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to planet_path(@planet)
    else
      render edit: :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to planet_path(@planet)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :grade).merge(planet_id: params[:planet_id])
  end

  def set_user
    @user = current_user
  end
  def set_review
    @review = Review.find(params[:id])
  end
end
