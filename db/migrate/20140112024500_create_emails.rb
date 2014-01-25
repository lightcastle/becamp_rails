class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email, :null => false
    end
    add_index :emails, :email, :unique => true
  end
end
