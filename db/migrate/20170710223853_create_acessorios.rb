class CreateAcessorios < ActiveRecord::Migration[5.1]
  def change
    create_table :acessorios do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
