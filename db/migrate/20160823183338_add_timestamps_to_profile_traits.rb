class AddTimestampsToProfileTraits < ActiveRecord::Migration
  def change
    change_table :profile_traits do |t|
      t.timestamps
    end
  end
end
