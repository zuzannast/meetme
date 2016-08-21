class RenameProfileGenres < ActiveRecord::Migration
  def change
    rename_table :profiles_genres, :profile_genres
  end
end
