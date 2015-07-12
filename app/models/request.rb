class Request < ActiveRecord::Base
  belongs_to :artist
  belongs_to :station
  belongs_to :promoter

end
