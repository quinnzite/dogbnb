class Dog < ApplicationRecord
  belongs_to :user
  has_many :fosterings, dependent: :destroy
  has_many :reviews, through: :fosterings
  validates :name, :breed, :location, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  mount_uploader :photo, PhotoUploader
end
