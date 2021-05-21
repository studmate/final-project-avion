class Pet < ApplicationRecord
  attr_accessor :images_cache
  mount_uploaders :images, ImageUploader
  skip_callback :commit, :after, :remove_previously_stored_images
  belongs_to :user
  validates :name, :breed, :specie, :birthdate, :age, presence: true
  validates :images, file_size: { less_than: 1.megabytes }
end
