class Artist < ActiveRecord::Base
  has_many :comments
  belongs_to :promoter
  has_attached_file :uploaded_file
  validates_attachment :uploaded_file, content_type: {content_type: "audio/mpeg"}
end
