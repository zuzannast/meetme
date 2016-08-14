module Api
  module V1
    class EventsController < Base
      include ShowtimeHelper
      expose :event
      expose :events, -> { Event.all }
      expose :showtimes, -> { showtimes_for_select }
      expose :user, -> { UserDecorator.new(current_user) }

      def show
        render json: event
      end

      def index
        render json: events
      end

      private

      def event_params
        params.require(:event).permit(:title, :description, :date, :showtime_id)
      end
    end
  end
end
