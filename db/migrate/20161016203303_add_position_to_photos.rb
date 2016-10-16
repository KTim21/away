class AddPositionToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :lat, :decimal
    add_column :photos, :lon, :decimal
  end
end
