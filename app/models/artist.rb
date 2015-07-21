require "open-uri"

class Artist < ActiveRecord::Base
  has_many :feedbacks, dependent: :destroy
  belongs_to :promoter
  has_many :stations, through: :promoter
  has_many :rankings
  default_scope { order(created_at: :desc) }
  has_attached_file :uploaded_file
  has_attached_file :picture_upload_1
  has_attached_file :picture_upload_2
  has_attached_file :picture_upload_3
  has_attached_file :picture_upload_4
  has_attached_file :picture_upload_5
  validates_attachment_content_type :uploaded_file, :content_type => ["audio/mpeg", "audio/mp3"]
  validates_attachment_content_type :picture_upload_1, :content_type => ["image/jpeg", "image/jpg", "image/png"]
  validates_attachment_content_type :picture_upload_2, :content_type => ["image/jpeg", "image/jpg", "image/png"]
  validates_attachment_content_type :picture_upload_3, :content_type => ["image/jpeg", "image/jpg", "image/png"]
  validates_attachment_content_type :picture_upload_4, :content_type => ["image/jpeg", "image/jpg", "image/png"]
  validates_attachment_content_type :picture_upload_5, :content_type => ["image/jpeg", "image/jpg", "image/png"]

  def uploaded_music_url(url)
    self.uploaded_file = URI.parse(url)
  end

  def uploaded_picture_1_url(url)
    self.picture_upload_1 = URI.parse(url)
  end

  def uploaded_picture_2_url(url)
    self.picture_upload_2 = URI.parse(url)
  end

  def uploaded_picture_3_url(url)
    self.picture_upload_3 = URI.parse(url)
  end

  def uploaded_picture_4_url(url)
    self.picture_upload_4 = URI.parse(url)
  end

  def uploaded_picture_5_url(url)
    self.picture_upload_5 = URI.parse(url)
  end

end
