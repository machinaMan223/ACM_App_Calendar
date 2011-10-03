class Event < ActiveRecord::Base
  default_scope :order => 'eventDate desc, eventTime desc'
  
  validates :name, :eventTime, :location, :description,
      :icon, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :duration, :numericality => {:greater_than_or_equal_to => 0}
  validates :name, :uniqueness => true
  validates :icon, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end