class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.text :description

      t.timestamps null: false
    end
  end
end
