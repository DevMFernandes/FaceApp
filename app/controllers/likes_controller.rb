class LikesController < ApplicationController
  def like_post
    redirect_to :root, notice: 'This is working'
  end

  def like_comment
  end

  def destroy
  end
end
