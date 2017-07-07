class CreateMunicaos < ActiveRecord::Migration[5.1]
  def change
    create_table :municaos do |t|
      t.string :calibre
      t.string :descricao

      t.timestamps
    end
  end
end
