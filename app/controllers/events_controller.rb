class EventsController < ApplicationController
  include ShowtimeHelper
  expose(:event) { Event.find(params[:id]) }
  expose(:events) { Event.all }
  expose(:showtimes) { showtimes_for_select }

  def show
    render json: Event.find(params[:id])
  end

  def index
    render json: Event.stream_for(current_user.id)
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(title: params[:title],
                      description: params[:description],
                      organiser_id: current_user.id
                      )
    event.users << current_user
    event.save

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
    params.require(:event).permit(:title, :description, :date, :showtime_id)
  end
end
