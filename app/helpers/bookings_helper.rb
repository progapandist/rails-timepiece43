module BookingsHelper

  def booking_links(booking)
    if booking.pending?
      link_to("Accept the booking", accept_booking_path(booking), class: "btn btn-primary booking-button") +
      link_to("Decline the booking", reject_booking_path(booking), class: "btn btn-danger booking-button")
    elsif booking.accepted?
      link_to "Decline the booking", reject_booking_path(booking), class: "btn btn-danger booking-button"
    else
      link_to "Accept the booking", accept_booking_path(booking), class: "btn btn-primary booking-button"
    end
  end

end
