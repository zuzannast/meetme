class EventsController < ApplicationController
  include ShowtimeHelper
  expose(:event) { Event.find(params[:id]) }
  expose(:events) { Event.all }
  expose(:showtimes) { showtimes_for_select }

  def show
  end

  def index
    render json: Event.order(created_at: :desc).all
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.create(description: params[:description], organiser_id: current_user.id)
    render json: event
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
