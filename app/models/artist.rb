class Artist < ActiveRecord::Base
  has_many :comments
  belongs_to :promoter
end
