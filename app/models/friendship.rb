class Friendship < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :recipient, class_name: "User"
  before_create :add_status
  before_create :friend_exists?
  before_create :friend_yourself?

  private

  def add_status
    self.status = false
  end

  def friend_exists?
    friend = Friendship.all.find do |f|
      (f.creator_id == self.creator_id && f.recipient_id == self.recipient_id) ||
      (f.recipient_id == self.creator_id && f.creator_id == self.recipient_id)
    end
    if friend
       throw(:abort)
    end
  end

  def friend_yourself?
    throw(:abort) if self.creator_id == self.recipient_id
  end

end
