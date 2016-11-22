class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :description, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  has_attachment :photo
end
