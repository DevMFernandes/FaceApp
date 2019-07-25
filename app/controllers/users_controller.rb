class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    @user = User.find(params[:id])
    #new thing
    #new
  end

  def index
    @users = User.all
  end
end
