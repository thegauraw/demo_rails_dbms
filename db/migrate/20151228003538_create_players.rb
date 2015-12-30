class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :country
      t.string :image_link
      t.text :description
      t.references :club, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
