class AddAttachmentTrackToLegs < ActiveRecord::Migration
  def self.up
    change_table :legs do |t|
      t.attachment :track
    end
  end

  def self.down
    remove_attachment :legs, :track
  end
end
