class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, numericality: true

  validates :user_id, uniqueness: true
  mount_uploader :photo, PhotoUploader
end
