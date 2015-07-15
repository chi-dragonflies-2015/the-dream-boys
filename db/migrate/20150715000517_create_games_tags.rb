class CreateGamesTags < ActiveRecord::Migration
  def change
    create_table :games_tags do |t|
      t.references :tag
      t.references :game
      t.timestamps null: false
    end
  end
end
