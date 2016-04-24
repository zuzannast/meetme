class AddReferencesToShowtime < ActiveRecord::Migration
  def change
    add_belongs_to :showtimes, :movie, index: true
  end
end
