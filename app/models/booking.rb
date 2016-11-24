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

  def past?
    self.end_date < Date.today
  end

  # Make sure end is earlier than the start
  validate :start_is_earlier_than_end

  def start_is_earlier_than_end
    if (end_date <= start_date)
      errors.add(:end_date, 'End date should be later than the start')
    end
  end
end
