class AdminController < ApplicationController
  def index
    @admin = is_admin
  end
  
end
