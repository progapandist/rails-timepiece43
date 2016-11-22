class Booking < ApplicationRecord
  belongs_to :watch
  belongs_to :user

  def init
    self.status ||= "pending"
  end
end
