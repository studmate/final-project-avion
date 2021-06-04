class Pet < ApplicationRecord
  attr_accessor :images_cache
  mount_uploaders :images, ImageUploader
  skip_callback :commit, :after, :remove_previously_stored_images

  belongs_to :user

  has_many :matches_sent, foreign_key: :requestor_id, class_name: 'Match', inverse_of: 'requestor', dependent: :destroy
  has_many :matches_request, foreign_key: :receiver_id, class_name: 'Match', inverse_of: 'receiver', dependent: :destroy
  
  has_many :success_matches, -> { merge(Match.match_true) }, through: :matches_sent, source: :receiver
  has_many :pending_matches, -> { merge(Match.match_false) }, through: :matches_sent, source: :receiver
  has_many :received_matches, -> { merge(Match.match_false) }, through: :matches_request, source: :requestor

  validates :name, :breed, :specie, :birthdate, :age, presence: true
  validates :images, file_size: { less_than: 1.megabytes }

end
