class CreateShowtimes < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.string :time
      t.references :cinema, index: true
      t.timestamps null: false
    end
  end
end
