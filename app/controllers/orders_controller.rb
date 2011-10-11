class OrdersController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]
  skip_before_filter :admin_authorize, :only => [:new, :create]
  
  # GET /orders
  # GET /orders.xml
  def index
    @admin = is_admin
    @orders = Order.paginate :page=>params[:page], :order=>'created_at desc',
      :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @admin = is_admin
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @admin = is_admin
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_url, :notice => "Your cart is empty"
    return
    end

    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @admin = is_admin
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @admin = is_admin
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)

    product = Product.find_by_title("VSU ACM Membership")
    user = User.find(session[:user_id])
    cart = current_cart
    
    cart.line_items.each do |line_item|
      if line_item.product_id = product.id
        user.paid = true
        user.update_attributes(:paid)
      end
    end

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to(store_index_path, :notice =>
           'Thank you for your order.') }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @admin = is_admin
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @admin = is_admin
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
end
