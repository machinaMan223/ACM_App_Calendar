class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :admin_authorize
  protect_from_forgery

  private
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
    
  def is_admin
    if session[:user_id]
      user = User.find(session[:user_id])
      user.admin
    else
      false
    end
  end

protected

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, :notice => "Please log in"
    end
  end

  def admin_authorize
     if session[:user_id]
       unless User.find(session[:user_id]).admin
         redirect_to acm_app_url
       end
     else
       redirect_to acm_app_url
     end
  end
end
