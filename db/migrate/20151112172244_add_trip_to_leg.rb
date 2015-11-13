class AddTripToLeg < ActiveRecord::Migration
  def change
    add_reference :legs, :trip, index: true, foreign_key: true
  end
end
