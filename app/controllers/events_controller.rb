class EventsController < ApplicationController
  include ShowtimeHelper
  expose(:event) { Event.find(params[:id]) }
  expose(:events) { Event.all }
  expose(:showtimes) { showtimes_for_select }

  def show
  end

  def index
  end

  def new
    @event = Event.new
  end

  def create
    binding.pry
    @event = Event.new(event_params)

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

  private

  def event_params
    params.require(:event).permit(:description, :date, :showtime_id)
  end
end
