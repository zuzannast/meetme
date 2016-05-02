class AddEventToShowtimes < ActiveRecord::Migration
  def change
    add_belongs_to :showtimes, :event, index: true
  end
end
