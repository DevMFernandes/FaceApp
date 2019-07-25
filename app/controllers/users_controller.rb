class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    
  end

  def index
    @users = User.all
  end
end
