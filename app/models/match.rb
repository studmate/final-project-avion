class Match < ApplicationRecord
  belongs_to :sent_by, class_name: 'Pet', foreign_key: 'sent_by_id'
  belongs_to :sent_to, class_name: 'Pet', foreign_key: 'sent_to_id'

  scope :matched,     -> { where('status = ?', true) }
  scope :not_matched, -> { where('status = ?', false) }
end
