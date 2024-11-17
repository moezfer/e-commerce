class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
  validates :name, :price, presence: true
end
