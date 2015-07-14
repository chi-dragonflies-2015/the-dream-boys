class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :username, null: false
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :bio
      t.boolean :admin
    end
  end
end
