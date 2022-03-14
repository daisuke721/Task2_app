class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :image
      t.string :address
      t.integer :price
      t.string :introduction
      t.integer :user_id

      t.timestamps
    end
  end
end
