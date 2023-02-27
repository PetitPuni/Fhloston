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
    @review = Reviews.new(review_params)
    @review.user = @user
    if @review.save
      redirect_to reviews_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to reviews_path
    else
      render 'edit'
    end
  end

  def destroy
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
  def set_review
    @review = Review.find(params[:id])
  end
end
