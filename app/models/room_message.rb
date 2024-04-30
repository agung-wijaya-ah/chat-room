class RoomMessage < ApplicationRecord
  belongs_to :room, inverse_of: :room_messages
  validates :message,:presence => true
end
