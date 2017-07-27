class CreateReservaarmamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :reservaarmamentos do |t|
      t.integer :armamento_id
      t.integer :qtd_armamento
      t.string :serie
      t.integer :reserva_id

      t.timestamps
    end
  end
end
