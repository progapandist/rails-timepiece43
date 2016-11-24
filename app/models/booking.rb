class Booking < ApplicationRecord
  belongs_to :watch
  belongs_to :user

  # Make sure end is earlier than the start
  validate :start_is_earlier_than_end

  def start_is_earlier_than_end
    if (end_date < start_date)
      errors.add(:end_date, 'Can not be earlier than a start date')
    end
  end
end
