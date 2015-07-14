class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :title
      t.string :image_url
      t.text :description
      t.integer :min_players
      t.integer :max_players
      t.integer :min_age
      t.integer :min_time
      t.integer :max_time
      t.timestamps
    end
  end
end
