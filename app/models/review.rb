class Review < ApplicationRecord
  belongs_to :fostering
  validates :rating, :content, presence: true
end
