class DropEmails < ActiveRecord::Migration
  def up
    drop_table :emails
  end

  def down
    create_table :emails do |t|
      t.string :email, :null => false
    end
    add_index :emails, :email, :unique => true
  end
end
