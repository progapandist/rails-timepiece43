class BookingsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    watches_array = @user.watches.map do |watch|
      watch.id
    end
    @bookings = Booking.where(watches_array.include?(watch_id))
  end
end
