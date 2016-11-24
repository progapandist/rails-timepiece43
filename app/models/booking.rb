class Booking < ApplicationRecord
  belongs_to :watch
  belongs_to :user

  after_create :send_pending_email


private

  def send_pending_email
    BookingMailer.pending(self).deliver_now
  end
end
