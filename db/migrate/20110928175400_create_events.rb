class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.date :eventDate
      t.time :eventTime
      t.int :duration
      t.string :location
      t.text :description
      t.double :price
      t.image_url :icon

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
