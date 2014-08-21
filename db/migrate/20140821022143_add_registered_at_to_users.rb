class AddRegisteredAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :registered_at, :datetime
  end
end
