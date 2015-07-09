class Promoter < ActiveRecord::Base
  has_many :artists
  has_secure_password
  has_and_belongs_to_many :stations
end
