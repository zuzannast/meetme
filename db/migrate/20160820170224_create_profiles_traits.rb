class CreateProfilesTraits < ActiveRecord::Migration
  def change
    create_table :profiles_traits do |t|
      t.integer :value
      t.belongs_to :profile, index: true
      t.belongs_to :trait, index: true
    end
  end
end
