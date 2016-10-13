class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_and_belongs_to_many :trips, -> { uniq }, join_table: :usertrips
  
  validates :name, presence: true, uniqueness: true
  has_secure_password
  enum role: [:editor, :admin]
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def rememberme
    self.remember_token = User.new_token
    update_attribute(:remember, User.digest(remember_token))
  end
  def authenticated?(remember_token)
    BCrypt::Password.new(remember).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember, nil)
  end
  
  def tripssorted
    trips.sort{|tripa, tripb| tripb.date <=> tripa.date}
  end
end
