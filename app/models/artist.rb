require "open-uri"

class Artist < ActiveRecord::Base
  has_many :comments
  belongs_to :promoter
  has_many :requests
  # has_many :stations through: :requests
  has_attached_file :uploaded_file
  validates_attachment_content_type :uploaded_file, :content_type => ["audio/mpeg", "audio/mp3"]

  def uploaded_file_url(url)
    self.uploaded_file = URI.parse(url)
  end

  def request_record(response, station_id)
    unless response == nil || response == ""
      Request.create!(requested: response, artist_id: self.id, station_id: station_id)
    end
  end
end
