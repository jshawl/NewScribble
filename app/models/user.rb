class User < ActiveRecord::Base
  has_secure_password
  has_many :artists #artists?
  # It would be nice if Users had many posts
end
