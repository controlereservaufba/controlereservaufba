class CreateControles < ActiveRecord::Migration[5.1]
  def change
    create_table :controles do |t|
      t.integer :reserva_id
      t.datetime :data_fechamento
      t.datetime :data_abertura
      t.boolean :status
      t.integer :qtd_municao
      t.integer :qtd_armamento
      t.integer :qtd_acessorio

      t.timestamps
    end
  end
end
