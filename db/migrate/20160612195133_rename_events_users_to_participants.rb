class RenameEventsUsersToParticipants < ActiveRecord::Migration
  def change
    rename_table :events_users, :participants
  end
end
