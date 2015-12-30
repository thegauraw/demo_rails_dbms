class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :title
      t.string :image_link
      t.text :description

      t.timestamps null: false
    end
  end
end
