class Pet < ApplicationRecord
  attr_accessor :images_cache
  mount_uploaders :images, ImageUploader
  skip_callback :commit, :after, :remove_previously_stored_images

  belongs_to :user

  has_many :match_sent, class_name: 'Match', foreign_key: 'sent_by_id', inverse_of: 'sent_by', dependent: :destroy
  has_many :match_request, class_name: 'Match', foreign_key: 'sent_to_id', inverse_of: 'sent_to', dependent: :destroy
  
  has_many :pet_matches,       -> { merge(Match.matched) },     through: :match_sent,    source: :sent_to
  has_many :sent_requests,     -> { merge(Match.not_matched) }, through: :match_sent,    source: :sent_to
  has_many :received_requests, -> { merge(Match.not_matched) }, through: :match_request, source: :sent_by

  validates :name, :breed, :specie, :description, :age, presence: true
  validates :images, file_size: { less_than: 1.megabytes }
end
