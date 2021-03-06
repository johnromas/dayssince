class User < ActiveRecord::Base

  has_many :goals, dependent: :destroy

  has_many :followings
  has_many :followers, :through => :followings

  has_many :inverse_followings, :class_name => "Following", :foreign_key => "follower_id"
  has_many :inverse_followers, :through => :inverse_followings, :source => :user

  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)
  
	def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.photo = user.facebook.get_picture("me", type: "normal")
      offset = auth.extra.raw_info.timezone
      user.time_zone = ActiveSupport::TimeZone[offset].name
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

  def streaks
    streaks = []
    goals.public_goals.each do |goal|
      streaks << goal if goal.current_record.streak > 10
    end
    streaks
  end

  def first_name
    name.split(" ")[0]
  end

  def last_name
    names = name.split(" ")
    names[1..-1].join(" ")
  end
end
