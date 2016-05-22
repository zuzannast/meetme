class AddOrganiserIdToUsers < ActiveRecord::Migration
  def change
    add_column :events, :organiser_id, :integer, unique: true
  end
end
