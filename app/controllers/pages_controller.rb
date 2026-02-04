class PagesController < ApplicationController
  allow_unauthenticated_access only: ['landing']
  def landing
    render "landing"
  end

  def dashboard
    render "dashboard"
  end
end