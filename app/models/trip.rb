class Trip < ActiveRecord::Base
  validates :title, presence: true
  has_many :legs
end
