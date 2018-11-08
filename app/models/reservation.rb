class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  validates :booked_from, presence: true
  validates :booked_to, presence: true
  validates :skipper, presence: true, inclusion: { in: ["Skipper", "Own Licence"]}
  validate :available

  def available
    self.boat.reservations.each do |r|
      if (booked_from..booked_to).overlaps?(r.booked_from..r.booked_to)
        errors.add(:booked_from, "not available")
        errors.add(:booked_to, "not available")
      end
    end
  end
end
