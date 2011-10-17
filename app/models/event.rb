class Event < ActiveRecord::Base
  has_event_calendar
  acts_as_gmappable
  
  default_scope :order => 'start_at desc'
  
  validates :name, :start_at, :end_at, :location, :description,
      :icon, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :name, :uniqueness => true
  validates :icon, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
  
  def gmaps4rails_address
    address
  end
  def gmaps4rails_infowindow
    "<h4>#{name}</h4>" << "<h4>#{address}</h4>"
  end
end
