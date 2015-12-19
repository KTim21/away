class AddHmAndTimeToLegs < ActiveRecord::Migration
  def change
    add_column :legs, :hm, :decimal
    add_column :legs, :time, :Time
    add_column :legs, :maxkmh, :decimal
  end
end
