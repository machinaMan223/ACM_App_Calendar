class AddClassificationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :classification, :string
  end

  def self.down
    remove_column :users, :classification
  end
end
