class StoreController < ApplicationController
  before_filter :authorize
  skip_before_filter :admin_authorize
  
  def index
    @admin = is_admin
    @products = Product.all
    @events = Event.all
    @cart = current_cart
  end

protected

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, :notice => "Please log in"
    end
  end
end
