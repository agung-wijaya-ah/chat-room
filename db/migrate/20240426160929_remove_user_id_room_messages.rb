class RemoveUserIdRoomMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :room_messages, :user_id
  end
end
