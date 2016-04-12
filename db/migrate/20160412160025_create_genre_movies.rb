class CreateGenreMovies < ActiveRecord::Migration
  def change
    create_table :genre_movies, id: false do |t|
      t.belongs_to :genre, index: true
      t.belongs_to :movie, index: true
    end
  end
end
