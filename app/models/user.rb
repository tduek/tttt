class User < ActiveRecord::Base
  has_attached_file :avatar, styles: {thumb: "100x100>"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
