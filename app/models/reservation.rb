class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  has_many :reviews
end
