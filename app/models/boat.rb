class Boat < ApplicationRecord
  belongs_to :user
  has_many :availibilities
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :boat_type, presence: true, inclusion: { in: ["sailboat", "motorboat", "catamaran", "RIB", "jet ski", "house boat"] }
  validates :city, presence: true
  validates :price, presence: true, numericality: true
  validates :size, presence: true, numericality: true

  mount_uploader :photo, PhotoUploader

end
