class CreateArmamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :armamentos do |t|
      t.string :modelo
      t.string :fabricante

      t.timestamps
    end
  end
end
