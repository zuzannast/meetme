module Api
  module V1
    class HomeController < Base
      expose :user, -> { UserDecorator.new(current_user) }
      expose :events, -> { Event.all }

      def index
      end
    end
  end
end
