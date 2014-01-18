class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :email, :null => false
    end
  end
end
