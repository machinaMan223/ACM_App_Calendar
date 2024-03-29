class EventsController < ApplicationController
  skip_before_filter :authorize, :only => :show
  skip_before_filter :admin_authorize, :only => :show
  # GET /events
  # GET /events.xml
  
  def index
    @events = Event.all
    @admin = is_admin
    
    @events.each do |event|
      event.gmaps = true
      event.update_attributes(:gmaps)
    end
    
    @json = Event.all.to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @admin = is_admin
    @event = Event.find(params[:id])
    
    @event.gmaps = true
    @event.update_attributes(:gmaps)
    
    @json = @event.to_gmaps4rails
    
    if session[:user_id]
      @user = User.find(session[:user_id])
      @user.gmaps = true
      @user.update_attributes(:gmaps)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @admin = is_admin
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @admin = is_admin
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @admin = is_admin
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @admin = is_admin
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @admin = is_admin
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
end
