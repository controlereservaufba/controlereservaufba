class CreateCautelamunicaos < ActiveRecord::Migration[5.1]
  def change
    create_table :cautelamunicaos do |t|
      t.integer :cautela_id
      t.integer :reservamunicao_id
      t.integer :qtd_municao
      t.integer :qtd_municao_baixado
      t.datetime :data_baixa
      t.boolean :baixa, :default => false

      t.timestamps
    end
  end
end
