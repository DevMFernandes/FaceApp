class LikesController < ApplicationController
  def like_post
    
    @post = Post.find(params[:id])
    @like = @post.likes.build
    @like.user_id = current_user.id

    if @like.save
      redirect_to :root, notice: 'I just liked something'
    else
      redirect_to :root, notice: 'Like failed'
    end
  end

  def like_comment
    redirect_to :root, notice: 'This is working'
  end

  def destroy
  end
end
