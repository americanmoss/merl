class AddIndustriesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :biotechnology, :boolean, default: true
    add_column :users, :software, :boolean, default: true
    add_column :users, :networking_wirless, :boolean, default: true
    add_column :users, :physics_engineering, :boolean, default: true
    add_column :users, :chemistry, :boolean, default: true
    add_column :users, :medical_devices, :boolean, default: true
  end
end
