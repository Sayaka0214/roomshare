class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.date :check_in
      t.date :check_out
      t.integer :nigtht
      t.integer :people
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
