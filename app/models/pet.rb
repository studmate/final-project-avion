class Pet < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :user
  validates :name, :breed, :specie, :birthdate, :age, presence: true
  validates :images, file_size: { less_than: 1.megabytes }
end
