class CreateCinemas < ActiveRecord::Migration
  def change
    create_table :cinemas do |t|
      t.string :name
      t.references :city, index: true
      t.timestamps null: false
    end
  end
end
