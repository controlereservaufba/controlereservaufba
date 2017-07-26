class CreateReservaacessorios < ActiveRecord::Migration[5.1]
  def change
    create_table :reservaacessorios do |t|
      t.integer :acessorio_id
      t.integer :qtd_acessorio
      t.string :serie
      t.integer :reserva_id

      t.timestamps
    end
  end
end
