class CreateReservamaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :reservamaterials do |t|
      t.integer :reserva_id
      t.integer :municao_id
      t.integer :acessorio_id
      t.boolean :status
      t.integer :user_id
      t.datetime :data

      t.timestamps
    end
  end
end
