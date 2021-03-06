class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, as: :likeable, dependent: :destroy

    validates :user_id, presence: true
    validates :body, presence: true
end
