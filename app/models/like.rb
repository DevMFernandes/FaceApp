class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  scope :like_posts, -> { where("likeable_type == ?", "Post") }
end
