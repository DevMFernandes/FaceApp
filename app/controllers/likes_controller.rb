class LikesController < ApplicationController
  before_action :already_liked?, only: [:create]
  before_action :find_like, only: [:destroy]
  before_action :not_liked?, only: [:destroy]

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
      redirect_to posts_path, notice: 'I just liked something'
    else
      redirect_to posts_path, notice: 'Like failed'
    end

  end

  def destroy
    @like.destroy
    redirect_to posts_path
  end

  private

    def already_liked?
      if params[:post_id]
        if Like.where(user_id: current_user.id, likeable_type: "Post", likeable_id: params[:post_id]).exists?
          redirect_to posts_path, notice: 'Already liked post!'
        end
      elsif params[:comment_id]
        if Like.where(user_id: current_user.id, likeable_type: "Comment", likeable_id: params[:comment_id]).exists?
          redirect_to posts_path, notice: 'Already liked comment!'
        end
      end

    end

    def not_liked?
      if params[:post_id]
        if !Like.where(user_id: current_user.id, likeable_type: "Post", likeable_id: params[:post_id]).exists?
          redirect_to posts_path, notice: 'Already unliked comment!'
        end
      elsif params[:comment_id]
        if !Like.where(user_id: current_user.id, likeable_type: "Comment", likeable_id: params[:comment_id]).exists?
          redirect_to posts_path, notice: 'Already unliked comment!'
        end
      end
    end

    def find_like
      if params[:post_id]
        @like = Like.find_by(likeable_id: params[:post_id], likeable_type: "Post", user_id: current_user.id)
      elsif params[:comment_id]
        @like = Like.find_by(likeable_id: params[:comment_id], likeable_type: "Comment", user_id: current_user.id)
      end
    end

end
