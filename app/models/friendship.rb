class Friendship < ApplicationRecord
  belongs_to :creator
  belongs_to :recipient
end
