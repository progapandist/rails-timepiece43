class Booking < ApplicationRecord
  belongs_to :watch
  belongs_to :user
  has_many :reviews

 # Make sure end is earlier than the start
  validate :start_is_earlier_than_end
  validates :start_date, presence: true
  validates :end_date, presence: true

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


  def start_is_earlier_than_end
    if start_date.nil? || end_date.nil?
      errors.add(:end_date, 'You should provide dates')
      return
    end
    if (end_date <= start_date)
      errors.add(:end_date, 'End date should be later than the start')
    end
  end

end
