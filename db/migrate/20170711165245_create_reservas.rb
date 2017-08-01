class CreateReservas < ActiveRecord::Migration[5.1]
  def change
    create_table :reservas do |t|
      t.string :sigla
      t.string :descricao
      t.integer :user_id
      t.boolean :status, :default => true
      t.datetime :data
      t.timestamps
    end
  end
end
