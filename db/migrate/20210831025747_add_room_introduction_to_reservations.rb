class AddRoomIntroductionToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :room_introduction, :string
  end
end
