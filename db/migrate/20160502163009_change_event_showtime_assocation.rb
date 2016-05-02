class ChangeEventShowtimeAssocation < ActiveRecord::Migration
  def change
    remove_column :showtimes, :event_id, :integer
    add_belongs_to :events, :showtime
  end
end
