class RemoveValueFromTraits < ActiveRecord::Migration
  def change
    remove_column :traits, :value, :integer
  end
end
