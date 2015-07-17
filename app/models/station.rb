class Station < ActiveRecord::Base
  has_many :feedbacks
  has_and_belongs_to_many :promoters
  has_many :artists, through: :promoters
  has_many :rankings
  accepts_nested_attributes_for :rankings, limit: 10
  has_secure_password
  has_attached_file :picture_upload
  validates_attachment_content_type :picture_upload, :content_type => ["image/jpeg", "image/jpg", "image/png"]
  validates :name, :station_name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true

  def artists_not_reviewed
    unreviewed_ids = self.artists.map {|artist| artist.id} - self.feedbacks.map {|feedback| feedback.artist_id}
    unreviewed_ids.map {|id| Artist.find(id)}
  end

  def picture_upload_url(url)
    self.picture_upload = URI.parse(url)
    self.save
  end

  def unresponded_feedback(promoter_id)
    all_unresponded = self.feedbacks.reject {|feedback| feedback.responded == true}
    (all_unresponded.select {|feedback| feedback.promoter.id == promoter_id}).count
  end
end
