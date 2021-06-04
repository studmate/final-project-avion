class Match < ApplicationRecord
  belongs_to :requestor, class_name: :Pet, foreign_key: :requestor_id
  belongs_to :receiver, class_name: :Pet, foreign_key: :receiver_id
  
  scope :match_true, -> { where( 'status =?', true) }
  scope :match_false, -> { where( 'status =?', false) }
end
