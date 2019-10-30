class Dog < ApplicationRecord
  belongs_to :user
  has_many :fosterings
  has_many :reviews, through: :fosterings
  validates :name, :breed, :location, presence: true
  mount_uploader :photo, PhotoUploader
end
