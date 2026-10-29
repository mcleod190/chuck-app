class CreateJokes < ActiveRecord::Migration[7.1]
  def change
    create_table :jokes do |t|
      t.text :content, null: false
      t.string :movie_title
      t.string :character_name
      t.text :scene_description
      t.string :image_url
      t.string :category, default: "General Badassery"
      t.integer :likes_count, default: 0, null: false
      t.boolean :featured, default: false, null: false

      t.timestamps
    end
    add_index :jokes, :category
    add_index :jokes, :featured
  end
end

