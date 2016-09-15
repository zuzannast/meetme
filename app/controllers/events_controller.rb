class EventsController < ApplicationController
  include ShowtimeHelper
  before_action :authenticate_user!, only: [:index]

  expose :event
  expose :events, -> { Event.all }
  expose :showtimes, -> { showtimes_for_select }
  expose :user, -> { UserDecorator.new(current_user) }

  def show
    render json: event
  end

  def index
    render json: personalised_events
  end

  def full_list
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

  def personalised_events
    events.personalised_stream(current_user.profile.city_id)
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :showtime_id)
  end
end
