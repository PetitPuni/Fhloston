class ReviewsController < ApplicationController
  before_action :set_user

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = @user.reviews.new(review_params)
    if @review.save
      redirect_to reviews_path
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to reviews_path
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:comment, :grade).merge(planet_id: params[:planet_id])
  end

  def set_user
    @user = current_user
  end
end
