class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.date :eventDate
      t.time :eventTime
      t.integer :duration
      t.string :location
      t.text :description
      t.double :price
      t.string :icon

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
