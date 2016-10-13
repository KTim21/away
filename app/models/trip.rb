class Trip < ActiveRecord::Base
  has_many :legs, -> { order(:date) }
  has_and_belongs_to_many :users, -> { uniq }, join_table: :usertrips
  
  has_attached_file :image,
    :styles => {
      :medium => "342x228#"
    }
  do_not_validate_attachment_file_type :image
  
  validates :title, presence: true
  
  def date
    if legs.first != nil && legs.first.date != nil
      legs.first.date
    else
      Date.parse('1970-01-01')
    end
  end
end
