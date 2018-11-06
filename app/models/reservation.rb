class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  has_many :reviews
  validates :booked_from, presence: true
  validates :booked_to, presence: true
end
