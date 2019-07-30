class LikesController < ApplicationController

  def create

    if already_liked?
      redirect_to posts_path, notice: 'already liked'
    end

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
      redirect_to posts_path, notice: 'I just liked something'
    else
      redirect_to posts_path, notice: 'Like failed'
    end
    
  end

  def destroy
  end

  private

    def already_liked?
      #Like.where(user_id: current_user.id, likeable_type: "Post", likeable_id: params[:likeable_id]).exists?
      return true
    end

end