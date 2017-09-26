# Add latitude and longitude to the places
class AddLatitudeAndLongitudeToPlace < ActiveRecord::Migration
  def change
    add_column :places, :latitude, :float
    add_column :places, :longitude, :float
  end
end
