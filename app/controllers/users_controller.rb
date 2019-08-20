class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], per_page: 10)
  end
end
