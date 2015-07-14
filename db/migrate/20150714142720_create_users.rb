class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username#, null: false
      t.string :first_name#, null: false
      t.string :last_name#, null: false
      t.string :password_digest#, null: false
      t.string :bio
      t.boolean :admin, default: false
    end
  end
end
