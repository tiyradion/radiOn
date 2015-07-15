class Feedback < ActiveRecord::Base
  belongs_to :artist
  belongs_to :station
  has_one :promoter, through: :artist
end
