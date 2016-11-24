class BookingMailerPreview < ActionMailer::Preview
  def pending
    user = User.first
    BookingMailer.pending(user).deliver_now
  end
end
