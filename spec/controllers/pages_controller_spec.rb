# frozen_string_literal: true

require "rails_helper"

RSpec.describe PagesController, type: :controller do
  render_views

  describe "GET #landing" do
    it "returns http success" do
      get :landing
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Welcome to Garage")
      expect(response.body).to include("Vehkalians")
    end

    it "returns welcome page" do
      get :landing
      expect(response.body).to include("Welcome to Garage")
      expect(response.body).to include("Vehkalians")
    end
  end

  describe "GET #dashboard" do
    it "returns http redirect" do
      get :dashboard
      expect(response.status).to equal(302)
    end

    it "page has sign in button" do
      get :landing
      expect(response.body).to include("Sign in")
    end

    context "user is authenticated" do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it "returns http success" do
        get :dashboard
        expect(response).to have_http_status(:success)
      end

      it "page has sign out button" do
        get :dashboard
        expect(response.body).to include("Sign out")
      end
    end
  end
end
