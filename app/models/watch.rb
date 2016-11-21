class Watch < ApplicationRecord
  belongs_to :user
  validates :description, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: true
end
