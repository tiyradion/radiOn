class Ranking < ActiveRecord::Base
  belongs_to :artist
  belongs_to :station
  validates :station_id, presence: true
  validates :rank, presence: true, uniqueness: {scope: [:station_id]}
  # validates :artist, presence: true, uniqueness: {scope: [:station_id]}
  default_scope { order(rank: :asc) }

  def self.batch_update(put_content)
    Ranking.transaction do
      JSON.parse(put_content).each do |ranking_hash|
        ranking = Ranking.find_by(id: ranking_hash["id"])
        ranking.update!(artist_id: ranking_hash["artist_id"], rank: ranking_hash["rank"])
      end
    end
  end
end
