class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, foreign_key: "creator_id"
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "recipient_id"
  belongs_to :location, required: false
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[facebook]
         

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def confirmed_friends
    created_friendships = Array.new
    created_friendships = friendships.select { |i| i.status == true}.map do |f|
      f.recipient
    end

    received_friendships = Array.new
    received_friendships = inverse_friendships.select { |i| i.status == true }.map do |f|
    f.creator
    end

    (created_friendships + received_friendships)
  end

  def find_friendship(user)
    friendship = self.friendships.find{|f| f.recipient == user} || self.inverse_friendships.find{|f| f.creator == user}
  end

  def confirmed_friends_ids
    confirmed_friends.map(&:id)
  end

  def pending_friendships
    pending = Array.new
    pending = friendships.select { |i| i.status == false }
  end

  def pending_invites
    pending = Array.new
    pending = inverse_friendships.select { |i| i.status == false }
  end

  def is_friend?(user)
    confirmed_friends.include?(user)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
