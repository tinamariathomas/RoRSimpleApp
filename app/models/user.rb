class User < ActiveRecord::Base
  validates :name, presence: true,length: {maximum:52}
  validates :email, presence: true
end
