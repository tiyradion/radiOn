class Ranking < ActiveRecord::Base
  belongs_to :artist
  belongs_to :station
  validates :station_id, presence: true
  validates :rank, presence: true, uniqueness: {scope: [:station_id, :artist_id]}
  validates :artist, presence: true, uniqueness: {scope: [:station_id]}
end
