class Leg < ActiveRecord::Base
  belongs_to :trip
  has_attached_file :track
  do_not_validate_attachment_file_type :track
end
