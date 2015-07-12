class Station < ActiveRecord::Base
  has_many :comments
  has_many :requests
  has_secure_password
  has_and_belongs_to_many :promoters
  has_attached_file :picture_upload
  validates_attachment_content_type :picture_upload, :content_type => ["image/jpeg", "image/png"]
  validates :name, :station_name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
end
