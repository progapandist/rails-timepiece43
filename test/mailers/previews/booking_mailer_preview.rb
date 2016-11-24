class BookingMailerPreview < ActionMailer::Preview
  def pending
    booking = Booking.first
    BookingMailer.pending(booking).deliver_now
  end
end
