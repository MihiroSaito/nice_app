class Post < ApplicationRecord

  mount_uploader :image, ImageUploader

  validates :title, :text, presence: true

  belongs_to :user
end
