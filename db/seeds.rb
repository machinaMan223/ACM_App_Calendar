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

Event.delete_all

Event.create(:name => 'Team Fortress 2 LAN Party',
  :start_at => (DateTime.civil(2011, 10, 7, 17, 0, 0, 0)),
  :end_at => (DateTime.civil(2011, 10, 7, 19, 0, 0)),
  :location => 'Nevins Hall 2109',
  :address => '1500 N Patterson St, Valdosta, GA 31698',
  :description =>
    %{<p>
        Come blow off some steam after midterms week. FREE TO PLAY!
      </p>},
  :price => 3.00, :icon => '/images/TF2.jpg')
  
Event.create(:name => 'ACM Welcome Picnic',
  :start_at => (DateTime.civil(2011, 9, 16, 15, 0, 0, 0)),
  :end_at => (DateTime.civil(2011, 9, 16, 17, 0, 0)),
  :location => 'McKey Park',
  :address => '112 Burton Ave.Valdosta, GA 31601',
  :description =>
    %{<p>
        Meet and greet picnic in the park.
      </p>},
  :price => 3.00, :icon => '/images/acm.jpg')

User.delete_all

User.create(:name => 'admin', :fullName => 'Administrator',
  :address => '1500 N Patterson St, Valdosta, GA 31698',
  :emailAddress => 'blank@blank.com', :admin => true, :paid => true,
  :password => 'admin', :classification => 'Senior')
