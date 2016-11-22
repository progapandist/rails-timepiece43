class BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = Booking.where(user: @user)
  end

  def owner_index

    ## I need to have @bookings equal to an array with all bookings
#
    @user = current_user
    owner_watches = @user.watches

    owner_watches_ids = owner_watches.map do |watch|
      watch.id
    end

    @bookings = []
    @user = current_user
    Booking.all.each do |booking|
      if owner_watches_ids.include?(booking.watch.id)
        @bookings << booking
      end
    end


  end

  def accepted
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save
    redirect_to owner_bookings_path
  end

  def rejected
    @booking = Booking.find(params[:id])
    @booking.status = "declined"
    @booking.save
    redirect_to owner_bookings_path
  end

  def show
   @booking = Booking.find(params[:id])
  end

  def new
    @watch = Watch.find(params[:watch_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @watch = Watch.find(params[:watch_id])
    @booking.watch = @watch
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :end)
  end
end
