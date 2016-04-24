class RenameCinameToTheater < ActiveRecord::Migration
  def change
    rename_table :cinemas, :theaters
    rename_column :showtimes, :cinema_id, :theater_id
  end
end
