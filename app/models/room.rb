class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy, inverse_of: :room
  validates :name, uniqueness: { case_sensitive: false }, :presence => true
end
