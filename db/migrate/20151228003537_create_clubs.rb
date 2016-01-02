class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :image_link
      t.string :country
      t.integer :established
      t.text :description
      t.references :sport, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
