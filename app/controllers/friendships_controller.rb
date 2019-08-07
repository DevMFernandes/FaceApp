class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:destroy, :update]
  before_action :friend_exists?, only: [:create]
  before_action :friend_self?, only: [:create]
  before_action :friendship_pending?, only: [:update]
  before_action :authenticate_user!

  require 'will_paginate/array'

  def index
    @friends = current_user.confirmed_friends.paginate(page: params[:page], per_page: 10)
  end

  def pending
    @requests = current_user.pending_invites.map{ |f| f.creator}.paginate(page: params[:page], per_page: 10)
  end

  def create
      @friendship = Friendship.new(friend_params)
      @friendship.creator_id = current_user.id
      
      if @friendship.save
        redirect_back(fallback_location: root_path)
      else
        redirect_to :root, notice: 'Request failed'
      end
  end

  def destroy
    if @friendship.destroy
      flash[:success] = "Request Cancelled"
      redirect_back(fallback_location: root_path)
    else
      redirect_back fallback_location: root_path, notice: "No friendship exists"
    end
  end

  def update
    @friendship.status = true
    if @friendship.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back fallback_location: root_path, notice: 'Request failed'
    end
  end

  private
    def friend_params
      params.require(:friendship).permit(:recipient_id)
    end

    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    def friend_exists?
      user = User.find_by(id: params[:friendship][:recipient_id])
      if current_user.confirmed_friends.include?(user)
        redirect_back fallback_location: root_path, notice: "Already a friend!"
      end
    end

    def friend_self?
      user = User.find_by(id: params[:friendship][:recipient_id])
      if current_user == user
        redirect_back fallback_location: root_path, notice: "Can't friend yourself!"
      end
    end

    def friendship_pending?
      if @friendship.status == true
        redirect_back fallback_location: root_path, notice: "Already a friend!"
      end
    end

end
