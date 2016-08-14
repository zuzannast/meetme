module Api
  module V1
    class ParticipantsController < Base
      expose :participants, -> { Participant.all }

      def create
        participant = Participant.create(event_id: params[:event_id],
                                         user_id: current_user.id)
        render json: participant
      end

      def destroy
        Participant.find_by(
          event_id: params[:id],
          user_id: current_user.id
        ).destroy

        render json: participants
      end
    end
  end
end
