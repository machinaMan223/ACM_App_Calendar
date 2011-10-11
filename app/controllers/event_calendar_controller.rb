class EventCalendarController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :admin_authorize
  
  def index
    @events = Event.all
    @admin = is_admin
  end

end
