class Pet < ApplicationRecord
  attr_accessor :images_cache
  mount_uploaders :images, ImageUploader
  skip_callback :commit, :after, :remove_previously_stored_images

  belongs_to :user
  has_many :matches_as_requestor, foreign_key: :requestor_id, class_name: :Match, dependent: :destroy
  has_many :matches_as_receiver, foreign_key: :receiver_id, class_name: :Match, dependent: :destroy
  
  has_many :matches, -> { merge(Match.match_true) }, through: :matches_as_requestor, source: :requestor
  has_many :pending_matches, -> { merge(Match.match_false) }, through: :matches_as_requestor, source: :requestor
  has_many :received_matches, -> { merge(Match.match_false) }, through: :matches_as_receiver, source: :receiver

  validates :name, :breed, :specie, :birthdate, :age, presence: true
  validates :images, file_size: { less_than: 1.megabytes }

end
