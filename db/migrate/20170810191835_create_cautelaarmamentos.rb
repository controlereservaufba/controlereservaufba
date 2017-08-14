class CreateCautelaarmamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :cautelaarmamentos do |t|
      t.integer :cautela_id
      t.integer :reservaarmamento_id
      t.integer :qtd_armamento
      t.integer :qtd_armamento_baixa
      t.datetime :data_baixa
      t.boolean :baixa,:default => false

      t.timestamps
    end
  end
end
