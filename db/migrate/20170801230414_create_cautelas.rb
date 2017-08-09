class CreateCautelas < ActiveRecord::Migration[5.1]
  def change
    create_table :cautelas do |t|
      t.integer :militar_id
      t.integer :reserva_id
      t.datetime :data_cautela
      t.datetime :data_fim_cautela

      t.timestamps
    end
  end
end
