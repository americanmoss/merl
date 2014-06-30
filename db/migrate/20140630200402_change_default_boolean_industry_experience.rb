class ChangeDefaultBooleanIndustryExperience < ActiveRecord::Migration
  def down
  	change_column :users, :biotechnology, :boolean, default: true
    	change_column :users, :software, :boolean, default: true
    	change_column :users, :networking_wirless, :boolean, default: true
    	change_column :users, :physics_engineering, :boolean, default: true
    	change_column :users, :chemistry, :boolean, default: true
    	change_column :users, :medical_devices, :boolean, default: true
  end

  def up
  	change_column :users, :biotechnology, :boolean, default: false
    	change_column :users, :software, :boolean, default: false
    	change_column :users, :networking_wirless, :boolean, default: false
    	change_column :users, :physics_engineering, :boolean, default: false
    	change_column :users, :chemistry, :boolean, default: false
    	change_column :users, :medical_devices, :boolean, default: false
  end

end
