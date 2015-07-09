class Station < ActiveRecord::Base
  has_many :comments
  has_secure_password
  has_and_belongs_to_many :promoters
end
