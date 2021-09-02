class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_introduction
      t.integer :room_price
      t.string :room_area
      t.text :room_address
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
