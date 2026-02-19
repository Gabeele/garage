# frozen_string_literal: true

require "rails_helper"

RSpec.describe PagesController, type: :controller do
  render_views

  describe "GET #popular" do
    it "returns http success" do
      get :popular
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Popular")
    end

    it "page has sign in link when not authenticated" do
      get :popular
      expect(response.body).to include("Sign in")
    end
  end

  describe "GET #home" do
    it "redirects when not authenticated" do
      get :home
      expect(response).to have_http_status(:redirect)
    end

    context "user is authenticated" do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it "returns http success" do
        get :home
        expect(response).to have_http_status(:success)
      end

      it "page has sign out button" do
        get :home
        expect(response.body).to include("Sign out")
      end
    end
  end
end
