class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
   @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
     @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
      # redirect_to(Restaurant.last)
    else
      render :new
    end
  end

def restaurant_params
  params.require(:restaurant).permit(:name, :category, :address)
end
end
