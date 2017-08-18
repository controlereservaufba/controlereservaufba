class CreateUsermilitars < ActiveRecord::Migration[5.1]
  def change
    create_table :usermilitars do |t|
      t.integer :militar_id
      t.integer :user_id
      t.datetime :data

      t.timestamps
    end
  end
end
