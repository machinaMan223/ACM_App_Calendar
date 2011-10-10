class AddEmailAddressToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :emailAddress, :string
  end

  def self.down
    remove_column :users, :emailAddress
  end
end
