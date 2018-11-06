class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  Validates :last_name, presence: true
  validates :phone, numericality: true
end
