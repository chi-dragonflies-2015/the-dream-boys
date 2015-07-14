class CreateDumbs < ActiveRecord::Migration
  def change
    create_table :dumbs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
