class User < ActiveRecord::Base
  validates :name, presence: true,length: {maximum:52}
  VALID_EMAIL_REGEX = /\A[\w]+@[\w]+\.[\w]+\z/
  validates :email, presence: true, format: {with:VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false }

  has_secure_password

  validates :password, length: {minimum:8}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
