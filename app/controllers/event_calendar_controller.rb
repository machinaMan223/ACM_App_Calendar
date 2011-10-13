class EventCalendarController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :admin_authorize
  
  def index
    @events = Event.all
    @admin = is_admin
    
    @events.each do |event|
      event.gmaps = true
      event.update_attributes(:gmaps)
    end
    
    @json = Event.all.to_gmaps4rails
  end

end
