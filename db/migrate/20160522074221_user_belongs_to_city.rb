class UserBelongsToCity < ActiveRecord::Migration
  def change
    remove_belongs_to :cities, :user, index: true
    add_belongs_to :users, :city, index: true
  end
end
