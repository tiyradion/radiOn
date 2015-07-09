class Promoter < ActiveRecord::Base
  has_many :artists
  has_secure_password
end
