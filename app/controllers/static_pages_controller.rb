class StaticPagesController < ApplicationController

  before_action :authenticate_user!, only: [:about]

  def home
    @title = "A WEBSITE!"
  end

  def about
  end
end
