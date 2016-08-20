class CreateProfilesGenres < ActiveRecord::Migration
  def change
    create_table :profiles_genres do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :genre, index: true
    end
  end
end
