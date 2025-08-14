class ReviewsController < ApplicationController

 def create
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review.restaurant = @restaurant
  @review = Review.new(review_params)
    if @review.save
    redirect_to restaurant_path(@restaurant)
      else
    render :new, status: :unprocessable_entity
    end
  end

 #def create
 # @review = Review.new(review_params)
 # @review.restaurant = @restaurant
 #   if @review.save
 #   redirect_to restaurant_path(@restaurant)
 #     else
 #   render :new, status: :unprocessable_entity
 # end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
