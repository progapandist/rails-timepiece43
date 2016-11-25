module BookingsHelper

  def booking_links(booking)
    if booking.past?
      link_to("Add a review for this booking", new_booking_review_path(booking), class: "btn btn-primary booking-button")
    elsif booking.pending?
      link_to("Accept the booking", accept_booking_path(booking), class: "btn btn-primary booking-button") +
      link_to("Decline the booking", reject_booking_path(booking), class: "btn btn-danger booking-button")
    elsif booking.accepted?
      link_to "Decline the booking", reject_booking_path(booking), class: "btn btn-danger booking-button"
    elsif booking.declined?
      link_to "Accept the booking", accept_booking_path(booking), class: "btn btn-primary booking-button"
    end
  end

  def booking_price(booking)
    price = booking.watch.price
    days = (booking.end_date - booking.start_date).floor
    return days * price
  end

  def label_status(booking)
    if booking.status == 'accepted'
     "label-success"
    elsif booking.status == 'declined'
      "label-danger"
    else
      "label-info"
    end
  end

end
