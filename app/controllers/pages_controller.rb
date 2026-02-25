class PagesController < ApplicationController
  allow_unauthenticated_access only: ['popular']
  def popular
    @posts = Post.includes(:user).order(likes: :desc, dislikes: :desc)
    render "popular"
  end

  def home
    render "home"
  end
end