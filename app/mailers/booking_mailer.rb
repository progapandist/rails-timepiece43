class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.pending.subject
  #


  def pending(booking)
    @booking = booking
    mail to: @booking.user.email, subject: "Booking pending approval"
  end
end
