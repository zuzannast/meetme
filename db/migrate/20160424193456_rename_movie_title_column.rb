class RenameMovieTitleColumn < ActiveRecord::Migration
  def change
    rename_column :movies, :name, :title
  end
end
