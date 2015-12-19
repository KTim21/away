class AddRememberDigestToUser < ActiveRecord::Migration
  def change
    add_column :users, :remember, :digest
  end
end
