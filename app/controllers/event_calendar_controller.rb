class EventCalendarController < ApplicationController
  def index
    @events = Event.all
  end

end
