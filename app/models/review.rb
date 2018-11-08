class Review < ApplicationRecord
  validates :rating, presence: true
  validates_inclusion_of :rating, :in => 1..5, :message => "has to be between 1 & 5"
  belongs_to :boat
end
