class LikesController < ApplicationController
  before_action :already_liked?, only: [:create]
  before_action :find_like, only: [:destroy]
  before_action :not_liked?, only: [:destroy]

  def create

    # Like Post
    if params[:like_type] == "Post"
      @post = Post.find(params[:likeable_id])
      @like = @post.likes.build
      #@like = Like.new(like_params)

      @like.user_id = current_user.id
      if @like.save
        redirect_to posts_path
      else
        redirect_to posts_path, notice: 'Like failed'
      end

    # Like Comment
    elsif params[:like_type] == "Comment"
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:likeable_id])
      @like = @comment.likes.build

      @like.user_id = current_user.id
      if @like.save
        redirect_to @post
      else
        redirect_to @post, notice: 'Like failed'
      end

    # If anything goes wrong
    else
      redirect_to :root, notice: 'the if statement failed'
    end

  end

  def destroy
    @like.destroy
    if params[:like_type] == "Post"
      redirect_to posts_path
    elsif params[:like_type] == "Comment"
      @post = Post.find(params[:post_id])
      redirect_to @post
    end
  end

  private
    def like_params
      params.require(:like).permit(:likeable_id, :likeable_type)
    end

    def like_exist?
      Like.where(user_id: current_user.id, likeable_type: params[:like_type], likeable_id: params[:likeable_id]).exists?
    end

    def already_liked?
      if params[:like_type] == "Post"
          redirect_to posts_path, notice: 'Already liked post!' if like_exist?
      elsif params[:like_type] == "Comment"
          redirect_to posts_path, notice: 'Already liked comment!' if like_exist?
      end
    end

    def not_liked?
      if params[:like_type] == "Post"
          redirect_to posts_path, notice: 'Already unliked comment!' if !like_exist?
      elsif params[:like_type] == "Comment"
          redirect_to posts_path, notice: 'Already unliked comment!' if !like_exist?
      end
    end

    def find_like
      @like = Like.find_by(likeable_id: params[:likeable_id], likeable_type: params[:like_type], user_id: current_user.id)
    end

end
