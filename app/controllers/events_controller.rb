class EventsController < ApplicationController
  include CityHelper
  expose(:event) { Event.find(params[:id]) }
  expose(:events) { Event.all }
  expose(:cities) { cities_for_select }

  def show
  end

  def index
  end

  def new
    @event = Event.new
  end

  def create
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if event.save
      redirect_to event_path(event)
    else
      render :edit
    end
  end

  def destroy
    event.destroy
    redirect_to events_path
  end
end
