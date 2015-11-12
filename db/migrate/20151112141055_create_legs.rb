class CreateLegs < ActiveRecord::Migration
  def change
    create_table :legs do |t|
      t.text :description
      t.decimal :distance

      t.timestamps null: false
    end
  end
end
