class RosterController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :admin_authorize
  
  def index
    @admin = is_admin
    @members = User.all
  end

end
