# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:topic) { FactoryBot.create :topic }
  let(:user) { create(:user) }

  before do
    sign_in user
  end
  context '#index' do
    it 'returns all topics' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response.body).as_json topic
    end
  end

  context '#show' do
    it 'returns a topic' do
      get :show, params: { name: topic }
      expect(response).to have_http_status(:ok)
      expect(response.body).as_json topic

    end
  end

  context '#new' do
    it 'returns a topic' do
      get :new
      expect(response).to have_http_status(:ok)
      expect(response.body).as_json Topic.new
    end
  end
end
