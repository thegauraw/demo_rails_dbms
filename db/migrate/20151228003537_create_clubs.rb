class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :image_link
      t.string :country
      t.string :established
      t.text :description
      t.references :sports, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
