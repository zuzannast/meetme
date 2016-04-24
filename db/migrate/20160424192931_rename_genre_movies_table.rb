class RenameGenreMoviesTable < ActiveRecord::Migration
  def change
    rename_table :genre_movies, :genres_movies
  end
end
