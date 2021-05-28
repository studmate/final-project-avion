class Match < ApplicationRecord
  belongs_to :requestor, class_name: :Pet
  belongs_to :receiver, class_name: :Pet
end
