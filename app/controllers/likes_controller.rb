class LikesController < ApplicationController

  def create

    # Like Post
    if params[:post_id]
      @post = Post.find(params[:post_id])
      @like = @post.likes.build

    # Like Comment
    elsif params[:comment_id]
      @comment = Comment.find(params[:comment_id])
      @like = @comment.likes.build

    # If anything goes wrong
    else
      redirect_to posts_path, notice: 'the if statement failed'
    end

    @like.user_id = current_user.id
    if @like.save
      redirect_to :root, notice: 'I just liked something'
    else
      redirect_to :root, notice: 'Like failed'
    end
  end

  def destroy
  end
end
