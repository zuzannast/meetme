class EventsController < ApplicationController
  include ShowtimeHelper
  expose(:event) { Event.find(params[:id]) }
  expose(:events) { Event.all }
  expose(:showtimes) { showtimes_for_select }
  expose_decorated(:user) { current_user }

  def show
    render json: Event.find(params[:id])
  end

  def index
    render json: Event.all
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(title: event_params[:title],
                      description: event_params[:description],
                      date: event_params[:date].to_datetime,
                      organiser_id: current_user.id,
                      showtime_id: event_params[:showtime_id]
                      )
    event.users << current_user
    if event.save
      redirect_to events_path
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
    params.require(:event).permit(:title, :description, :date, :showtime_id)
  end
end
