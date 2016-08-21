class RenameProfileTraits < ActiveRecord::Migration
  def change
    rename_table :profiles_traits, :profile_traits
  end
end
