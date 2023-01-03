class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[show edit update destroy]
  def index
    @events = Event.all.includes(:creator)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: "Event updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event deleted successfully"
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :datetime)
  end
end
