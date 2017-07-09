class CreateMilitars < ActiveRecord::Migration[5.1]
  def change
    create_table :militars do |t|
      t.string :nome
      t.string :nome_guerra
      t.string :posto

      t.timestamps
    end
  end
end
