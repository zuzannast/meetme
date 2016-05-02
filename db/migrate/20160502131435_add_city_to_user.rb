class AddCityToUser < ActiveRecord::Migration
  def change
    add_belongs_to :cities, :user, index: true
  end
end
