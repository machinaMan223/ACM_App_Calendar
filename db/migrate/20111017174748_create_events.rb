class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.string :location
      t.string :address
      t.float :longitude
      t.float :latitude
      t.text :description
      t.decimal :price
      t.string :icon
      t.boolean :gmaps
      
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
