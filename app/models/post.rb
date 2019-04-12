class Post < ApplicationRecord
  belongs_to :user
  as_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader
  validates :image,:content, presence: true
end
