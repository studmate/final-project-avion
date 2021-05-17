class Pet < ApplicationRecord
  belongs_to :user
  validates :name, :breed, :specie, :birthdate, :age, presence: true
end
