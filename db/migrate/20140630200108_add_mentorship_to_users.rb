class AddMentorshipToUsers < ActiveRecord::Migration
  def change
    add_column :users, :availability, :boolean, default: false
    add_column :users, :mentoring, :boolean, default: false
    add_column :users, :deffered_payment, :boolean, default: false
    add_column :users, :raised_money, :boolean, default: false
    add_column :users, :successful_exit, :boolean, default: false
    add_column :users, :startup_experience, :boolean, default: false
  end
end
