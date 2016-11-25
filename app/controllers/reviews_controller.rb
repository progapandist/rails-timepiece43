class ReviewsController < ApplicationController

  def index
  end
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    if current_user == @review.booking.watch.user
      @review.owner = true
    else
      @review.owner = false
    end
    if @review.save
      if @review.booking.user == current_user
        redirect_to user_path(@review.booking.watch.user)
      else
        redirect_to user_path(@review.booking.user)
      end
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :rating, :content)
  end
end
