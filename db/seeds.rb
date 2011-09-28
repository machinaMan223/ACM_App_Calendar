# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Product.delete_all
Product.create(:title => 'VSU ACM Membership',
  :description =>
    %{<p>
        This item allows you to pay your membership dues online.
      </p>},
  :image_url => '/images/acm.jpg',
  :price => 20.00)
  
 Event.create(:name => 'Team Fortress 2 LAN Party',
  :eventDate => '10/07/2011', :eventTime => '5:00:00'
  :duration => 3, :location => 'NH 2109',
  :description =>
    %{<p>
        Come blow off some steam after midterms week. FREE TO PLAY!
      </p>},
  :icon => '/images/TF2.jpg',
  :price => 3.00)
