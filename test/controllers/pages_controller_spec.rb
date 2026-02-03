# frozen_string_literal: true

require "rails_helper"

RSpec.describe PagesController, type: :controller do
  render_views

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Welcome to Garage")
      expect(response.body).to include("Vehkalians")
    end

    it "returns welcome page" do
      get :home
      expect(response.body).to include("Welcome to Garage")
      expect(response.body).to include("Vehkalians")
    end
  end
end
