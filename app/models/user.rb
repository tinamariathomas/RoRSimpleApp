class User < ActiveRecord::Base
  validates :name, presence: true,length: {maximum:52}
  VALID_EMAIL_REGEX = /\A[\w]+@[\w]+\.[\w]+\z/
  validates :email, presence: true, format: {with:VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false }

  has_secure_password

  validates :password, length: {minimum:8}
end
