class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
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
