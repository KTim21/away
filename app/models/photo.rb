class Photo < ActiveRecord::Base
  belongs_to :leg
  has_attached_file :image,
    :styles => {
      :medium => "560x840"
    }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_presence :image
end
