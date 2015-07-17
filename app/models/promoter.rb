class Promoter < ActiveRecord::Base
  has_many :artists
  has_many :feedbacks, through: :artists
  has_and_belongs_to_many :stations
  has_secure_password
  has_attached_file :picture_upload
  validates_attachment_content_type :picture_upload, :content_type => ["image/jpeg", "image/jpg", "image/png"]
  validates :name, :company_name, presence: true
  validates :email, presence: true, uniqueness: true

  def picture_upload_url(url)
    self.picture_upload = URI.parse(url)
    self.save
  end

  def all_unresponded_feedback
    self.feedbacks.reject {|feedback| feedback.responded == true}
  end
end
