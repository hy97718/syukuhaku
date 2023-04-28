class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :room_title
      t.text :room_info
      t.integer :room_price
      t.string :address
      t.string :room_image
      t.timestamps
    end
  end
end
