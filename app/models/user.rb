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
         :recoverable, :rememberable, :validatable


   def friends
     created_friendships = Array.new
     created_friendships = friendships.map do |f|
       f.recipient if f.status == true
     end

     received_friendships = Array.new
     received_friendships = inverse_friendships.map do |f|
       f.creator if f.status == true
     end

     created_friendships + received_friendships
     
    end
end
