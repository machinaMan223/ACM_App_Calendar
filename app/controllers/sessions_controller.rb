class SessionsController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :admin_authorize
  
  def new
    @admin = is_admin
  end

  def create
    @admin = is_admin
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to acm_app_url
    else
redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    @admin = is_admin
    session[:user_id] = nil
    redirect_to acm_app_url, :notice => "Logged out"
  end

end
