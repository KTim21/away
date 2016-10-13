class Trip < ActiveRecord::Base
  has_many :legs, -> { order(:date) }
  has_and_belongs_to_many :users, -> { uniq }, join_table: :usertrips
  
  has_attached_file :image,
    :styles => {
      :medium => "560x840"
    }
  do_not_validate_attachment_file_type :image
  
  validates :title, presence: true
end
