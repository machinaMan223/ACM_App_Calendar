class StoreController < ApplicationController
  def index
    @products = Product.all
    @events = Event.all
  end

end
