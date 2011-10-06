class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :fullName, :string
    add_column :users, :admin, :boolean
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :gmaps, :boolean
  end

  def self.down
    remove_column :users, :gmaps
    remove_column :users, :longitude
    remove_column :users, :latitude
    remove_column :users, :admin
    remove_column :users, :fullName
    remove_column :users, :phone
    remove_column :users, :address
    remove_column :users, :email
  end
end
