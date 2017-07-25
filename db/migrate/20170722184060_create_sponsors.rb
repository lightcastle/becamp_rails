class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.text :homepage_url
      t.text :logo_url
      t.integer :width
      t.integer :sequence

      t.timestamps null: false
    end
  end
end
