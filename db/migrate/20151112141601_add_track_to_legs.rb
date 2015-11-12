class AddTrackToLegs < ActiveRecord::Migration
  def change
    add_column :legs, :track, :string
  end
end
