require "open-uri"

class Artist < ActiveRecord::Base
  has_many :feedbacks
  belongs_to :promoter
  has_many :stations, through: :feedbacks
  has_attached_file :uploaded_file, :picture_upload_1, :picture_upload_2, :picture_upload_3
  validates_attachment_content_type :uploaded_file, :content_type => ["audio/mpeg", "audio/mp3"]
  validates_attachment_content_type :picture_upload_1, :content_type => ["image/jpeg", "image/png"]
  validates_attachment_content_type :picture_upload_2, :content_type => ["image/jpeg", "image/png"]
  validates_attachment_content_type :picture_upload_3, :content_type => ["image/jpeg", "image/png"]

  def uploaded_file_url(url)
    self.uploaded_file = URI.parse(url)
  end

  def request_record(response, station_id)
    unless response == nil || response == "" || response == "false"
      Request.create!(requested: response, artist_id: self.id, station_id: station_id)
    end
  end

  def add_comment(comment, station_id)
    unless comment == nil || comment == ""
      Comment.create!(description: comment, artist_id: self.id, station_id: station_id)
    end
  end
end
