class RosterController < ApplicationController
  def index
    @members = User.all
  end

end
