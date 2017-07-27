class CreateReservamunicaos < ActiveRecord::Migration[5.1]
  def change
    create_table :reservamunicaos do |t|
      t.integer :municao_id
      t.integer :qtd_municao
      t.string :serie
      t.integer :reserva_id

      t.timestamps
    end
  end
end
