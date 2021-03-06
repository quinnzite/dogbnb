class User < ApplicationRecord
  has_many :dogs
  has_many :fosterings
  validates :first_name, :last_name, presence: true
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
