class AddTimestampsToProfileGenres < ActiveRecord::Migration
  def change
    change_table :profile_genres do |t|
      t.timestamps
    end
  end
end
