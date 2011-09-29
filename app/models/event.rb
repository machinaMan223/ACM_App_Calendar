class Event < ActiveRecord::Base
  default_scope :order => 'eventDate desc, eventTime desc'
  
  validates :name, :eventTime, :location, :description,
      :icon, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :duration, :numericality => {:greater_than_or_equal_to => 0}
  validates :name, :uniqueness => true
  validates :eventDate, :format => (%m/%d/%Y,
    :message => 'date must be in MM/DD/YYYY format')
  validates :eventTime, :format => (%m/%d/%Y,
    :message => 'time must be in HH:MM format')
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end