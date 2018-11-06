class Boat < ApplicationRecord
  belongs_to :user
  has_many :availibilities
  has_many :reservations

  validates :name, presence: true
  validates :type, presence: true, inclusion: { in: ["sailboat", "motorboat", "catamaran", "RIB", "jet ski", "house boat"] }
  validates :city, presence: true
  validates :price, presence: true, numericality: true
  validates :size, presence: true, numericality: true
end
