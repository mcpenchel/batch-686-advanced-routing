class ReviewsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      # Redirect To
      # It forces the user's browser to make a new request to the provided
      # path. In this case, the user will make a GET request to /restaurants/some-id
      redirect_to restaurant_path(@review.restaurant)
    else
      # Render
      # It skips the controller+action,
      # it just goes straight to the view and render it (which means, we
      # need all the variables from that view in the action that you render.
      # That's why @restaurant is needed in here, because we need it in order
      # to render the restaurants/show.html.erb)
      render 'restaurants/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
