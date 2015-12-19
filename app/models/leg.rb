class Leg < ActiveRecord::Base
  belongs_to :trip
  has_many :photos, :dependent => :destroy
  has_attached_file :track
  do_not_validate_attachment_file_type :track
  validates :title, presence: true
  
  def prev_leg()
    trip.legs.where("date < ?", date).order('date asc').last
  end
  
  def next_leg()
    trip.legs.where("date > ? ", date).order('date asc').first
  end
end
