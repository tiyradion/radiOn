class Promoter < ActiveRecord::Base
  has_many :artists
  has_many :stations
  has_many :requests, through: :stations
  has_secure_password
  has_and_belongs_to_many :stations
  has_attached_file :picture_upload
  validates_attachment_content_type :picture_upload, :content_type => ["image/jpeg", "image/png"]
  validates :name, :password, :company_name, presence: true
  validates :email, presence: true, uniqueness: true
end
