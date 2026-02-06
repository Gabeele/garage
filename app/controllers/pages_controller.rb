class PagesController < ApplicationController
  allow_unauthenticated_access only: ['popular']
  def popular
    render "popular"
  end

  def home
    render "home"
  end
end