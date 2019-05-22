class ReviewsController < ApplicationController

  #  def show
  #   @review = Review.find(params[:id])
  # end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save

      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

    # @restaurant = Restaurant.new(restaurant_params)
    # if @restaurant.save
    #   redirect_to restaurant_path(@restaurant)
    #   # redirect_to(Restaurant.last)
    # else
    #   render :new
    # end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
