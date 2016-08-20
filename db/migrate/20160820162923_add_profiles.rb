class AddProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :user, index: true
      t.belongs_to :cities, :user, index: true
      t.references :genres, index: true
      t.timestamps null: false
    end
  end
end
