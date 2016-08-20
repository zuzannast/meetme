class RenameColumnsProfile < ActiveRecord::Migration
  def change
    rename_column :profiles, :cities_id, :city_id
    remove_column :profiles, :genres_id, :integer
  end
end
