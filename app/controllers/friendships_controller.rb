class FriendshipsController < ApplicationController
  def create
      @friendship = Friendship.new(friend_params)
      @friendship.creator_id = current_user.id
      @friendship.status = false
      if @friendship.save
        redirect_to users_path
      else
        redirect_to :root, notice: 'Request failed'
      end
  end

  def destroy
  end

  private
    def friend_params
      params.require(:friendship).permit(:recipient_id)
    end
end
