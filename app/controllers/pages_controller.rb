class PagesController < ApplicationController
  allow_unauthenticated_access
  def home
    render "landing"
  end
end