class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :friender
      t.references :friendee
    end
  end
end
