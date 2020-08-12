class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to @review, notice: 'Review was successfully created.'
      # redirect_to restaurant_reviews_path(@review)
    else
      render "restaurants/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:context, :rating)
  end
  

end
