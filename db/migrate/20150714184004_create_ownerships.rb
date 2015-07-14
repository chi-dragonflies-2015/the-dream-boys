class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.references :owners
      t.references :games
      t.timestamps
    end
  end
end
