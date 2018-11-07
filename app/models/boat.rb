class Boat < ApplicationRecord
  belongs_to :user
  has_many :availibilities
  has_many :reservations
  has_many :reviews

  validates :name, presence: true
  validates :boat_type, presence: true, inclusion: { in: ["sailboat", "motorboat", "catamaran", "RIB", "jet_ski", "house_boat"] }
  validates :city, presence: true
  validates :price, presence: true, numericality: true
  validates :size, presence: true, numericality: true
end
