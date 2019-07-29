class CommentsController < ApplicationController
  #before_action :set_post

  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @comment = Comment.find(params[:id])
    #@post = Post.find(params[:post][:id])
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to :root
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
      #params.require(:comment).permit(:body).merge(user_id: current_user.id)
    end
end
