class CreateCautelaacessorios < ActiveRecord::Migration[5.1]
  def change
    create_table :cautelaacessorios do |t|
      t.integer :cautela_id
      t.integer :reservaacessorio_id
      t.integer :qtd_acessorio
      t.integer :qtd_acessorio_baixa
      t.datetime :data_baixa
      t.boolean :baixa, :default => false

      t.timestamps
    end
  end
end
