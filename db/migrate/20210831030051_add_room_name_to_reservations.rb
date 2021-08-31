class AddRoomNameToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :room_name, :string
  end
end
