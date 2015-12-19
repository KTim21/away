class AddTitleToLeg < ActiveRecord::Migration
  def change
    add_column :legs, :title, :string
  end
end
