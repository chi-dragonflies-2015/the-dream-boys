class CreateTesttests < ActiveRecord::Migration
  def change
    create_table :testtests do |t|

      t.timestamps null: false
    end
  end
end
