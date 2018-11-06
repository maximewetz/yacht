class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  has_many :reviews
  validates :booked_from, presence: true
  validates :booked_to, presence: true
  validates :skipper, presence: true, inclusion: { in: ["Skipper", "Own Licence"]}
end
