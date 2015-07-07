require "open-uri"

class Artist < ActiveRecord::Base
  has_many :comments
  belongs_to :promoter
  has_attached_file :uploaded_file
  validates_attachment_content_type :uploaded_file, :content_type => ["audio/mpeg", "audio/mp3"]

  def uploaded_file_url(url)
    self.uploaded_file = URI.parse(url)
  end
end
