class Event < ActiveRecord::Base
  validates :name, :eventDate, :eventTime, :location, :description,
      :icon, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :duration, :numericality => {:greater_than_or_equal_to => 0}
  validates :name, :uniqueness => true
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
}
end
