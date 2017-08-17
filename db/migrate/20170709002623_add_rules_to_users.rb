class AddRulesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :admin_reserva, :boolean, :default => false
    add_column :users, :usuario, :boolean, :default => true
  end
end
