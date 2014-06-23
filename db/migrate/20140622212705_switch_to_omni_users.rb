class SwitchToOmniUsers < ActiveRecord::Migration
  def up
    remove_column :users, :encrypted_password
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at
    remove_column :users, :remember_created_at
    remove_column :users, :last_sign_in_ip
    remove_column :users, :current_sign_in_ip

    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string

    add_column :users, :admin, :boolean, null: false, default: false

    add_column :users, :attending, :boolean
    add_column :users, :heard_about_by, :string
    add_column :users, :first_time_attendee, :boolean
    add_column :users, :shirt_size, :string
  end

  def down
    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :name
    remove_column :users, :admin
    remove_column :users, :heard_about_by
    remove_column :users, :first_time_attendee
    remove_column :users, :shirt_size
    remove_column :users, :attending

    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime
    add_column :users, :encrypted_password, :string, null: false, default: ''
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
  end
end
