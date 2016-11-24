class BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = Booking.where(user: @user)
  end

  def dashboard
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
    redirect_to dashboard_path
  end

  def rejected
    @booking = Booking.find(params[:id])
    @booking.status = "declined"
    @booking.save
    redirect_to dashboard_path
  end

  def show
   @booking = Booking.find(params[:id])
  end

  def new
    @watch = Watch.find(params[:watch_id])
    @booking = Booking.new

    # TODO: Remove this code later if we never use separate new booking form
    # Get all booked ranges in an array of Ranges with Dates
    date_ranges_taken = []
    @watch.bookings.each do |b|
      date_ranges_taken << (b.start_date..b.end_date)
    end

    # generate an array of strings in dd/mm/yyyy
    @dates_taken = []
    date_ranges_taken.each do |r|
      r.each do |date|
        @dates_taken << date.strftime('%d/%m/%Y')
      end
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @watch = Watch.find(params[:watch_id])
    @booking.watch = @watch
    if @booking.save
      redirect_to booking_path(@booking)
    else
      flash[:alert] = "End date should be later than the start. One night minimum"
      redirect_to watch_path(@watch)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
