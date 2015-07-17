class Ranking < ActiveRecord::Base
  belongs_to :artist
  belongs_to :station
end
