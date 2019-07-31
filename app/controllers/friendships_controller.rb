class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new
      @friendship.creator_id = current_user.id
      @friendship.recipient_id = params[:recipient_id]
      @friendship.status = false
      if @friendship.save
        redirect_to friendships_path
      else
        redirect_to :root, notice: 'Request failed'
      end
  end

  def destroy
  end
end
