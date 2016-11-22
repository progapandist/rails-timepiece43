class BookingsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    watches_array = @user.watches.map do |watch|
      watch.id
    end
    @bookings = Booking.where(watches_array.include?(watch_id))
  end

  def show
    if current_user.id == params[:user_id]
      @booking = Booking.find(params[:booking_id])
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @booking = Booking.new
    @user = User.find(params[:user_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @booking.user = @user
    if @booking.save
      redirect_to user_booking_path(@user, @booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :end)
  end
end
