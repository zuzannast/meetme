class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.string :genre
      t.string :origin
      t.timestamps null: false
    end
  end
end
