class Booking < ApplicationRecord
  belongs_to :watch
  belongs_to :user

  def accepted?
    status == "accepted"
  end

  def pending?
    status == "pending"
  end

  def declined?
    status == "declined"
  end
end
