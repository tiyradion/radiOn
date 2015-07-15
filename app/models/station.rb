class Station < ActiveRecord::Base
  has_many :feedbacks
  has_and_belongs_to_many :promoters
  has_many :artists, through: :promoters
  has_secure_password
  has_attached_file :picture_upload
  validates_attachment_content_type :picture_upload, :content_type => ["image/jpeg", "image/jpg", "image/png"]
  validates :name, :station_name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true

  def artists_reviewed

    self.artists.each do |artist|
      artist.feedbacks.reject {|feedback| feedback.station_id == self.id }

    end
  end

  def picture_upload_url(url)
    self.picture_upload = URI.parse(url)
    self.save
  end
end
