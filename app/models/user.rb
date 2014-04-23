class User < ActiveRecord::Base
  has_attached_file :avatar, styles: {thumb: "100x100>"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by(provider: auth_hash[:provider], uid: auth_hash[:uid])

    return user if user

    User.create!(provider: auth_hash[:provider],
                 uid: auth_hash[:uid],
                 email: auth_hash[:info][:email])
  end
end
