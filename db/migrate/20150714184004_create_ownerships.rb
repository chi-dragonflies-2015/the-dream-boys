class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.references :owner
      t.references :game
      t.timestamps
    end
  end
end
