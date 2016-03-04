class AddShowMyNameOnRegistrationList < ActiveRecord::Migration
  def change
    add_column :users, :list_me, :boolean
  end
end

