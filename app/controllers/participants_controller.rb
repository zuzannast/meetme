class ParticipantsController < ApplicationController

  def create
    participant = Participant.create(event_id: params[:event_id],
                                     user_id: current_user.id)
    render json: participant
  end
end
