class User < ActiveRecord::Base

  has_many :goals
  
	def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.photo = user.facebook.get_picture("me", type: "normal")
      # user.photo = facebook.get_photo("me")
      user.save!
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  def get_photo
    self.photo = facebook.get_picture("me", type: "normal")
    self.save!
  end
end
