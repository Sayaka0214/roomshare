class AddRoomIdToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :room_id, :integer
  end
end
