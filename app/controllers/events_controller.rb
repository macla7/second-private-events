class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy create_ass accept ]
  before_action :set_current_user, only: %i[ index show accept ]

  # GET /users or /users.json
  def index
    @events = Event.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @event = Event.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @event = Event.new(event_params)
    @event.user_id = session[:user_id]
    if @event.save
      flash[:notice] = "Made new event #{event_params[:name]}!"
      redirect_to '/users'
    else
      flash.now[:error] = "Could not save client"
    end
  end

  def create_ass
    if User.find_by(name: params[:name]).nil?
      flash[:error] = 'User doesn\'t exist!'
      redirect_to "/events/#{@event.id}"
    else
      id = User.find_by(name: params[:name]).attributes.slice('id')
      @eventlog = Eventlog.new(attendee_id: id['id'])
      @eventlog.event_id = @event.id
      @eventlog.invite_accept = false
      if @eventlog.save!
        flash.now[:notice] = "Made new invite to #{params[:name]}!"
        redirect_to '/events'
      else
        flash.now[:error] = @eventlog
        render action: "show"
      end
    end
  end

  def accept
    @up_event = @current_user.events.delete(@event)
    @new_event = Eventlog.new(attendee_id: session[:user_id], event_id: params[:id], invite_accept: true)
    
    if @new_event.save!
      flash.now[:notice] = "Accepted Invite!"
      redirect_to '/events'
    else
      flash.now[:error] = @eventlog
      render action: "show"
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :location, :time)
  end

  def invite_params
    params.permit(:name)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_current_user
    @current_user = User.find(session[:user_id])
  end
end
