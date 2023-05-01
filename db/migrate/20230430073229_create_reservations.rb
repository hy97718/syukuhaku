class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :room_check_in
      t.date :room_check_out
      t.integer :number_of_reserve
      t.integer :sum_of_price
      t.timestamps
    end
  end
end
