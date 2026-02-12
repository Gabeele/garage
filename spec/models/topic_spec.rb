# frozen_string_literal: true

require "rails_helper"

RSpec.describe Topic, type: :model do
  subject(:topic) { create(:topic) }
  let(:user) {create(:user)}
  context "validations" do

    it "is valid for valid attributes" do
      topic = Topic.new(name: "name", user:)
      expect(topic).to be_valid
    end

    it "is valid dashes in name" do
      topic = Topic.new(name: "hello-world-123", user:user)
      expect(topic).to be_valid
    end

    it "is valid for in length of 1" do
      topic = Topic.new(name: "1", user:)
      expect(topic).to be_valid
    end

    it "is valid for in length of 20" do
      topic = Topic.new(name: 'asdfghjklpasdfghjklp', user:)
      expect(topic).to be_valid
    end

    it "is invalid for in length 0" do
      topic = Topic.new(name: '', user:)
      topic.valid?
      expect(topic.errors[:name]).to include("is too short (minimum is 1 character)")
    end

    it "is invalid for in length 21" do
      topic = Topic.new(name: 'asdfghjklpasdfghjsklp', user:)
      topic.valid?
      expect(topic.errors[:name]).to include("is too long (maximum is 20 characters)")
    end

    it "is invalid without name" do
      topic = Topic.new(user:user)
      topic.valid?
      expect(topic.errors[:name]).to include("can't be blank")
    end

    it "is invalid with spaces in name" do
      topic = Topic.new(name: "hello world", user:user)
      topic.valid?
      expect(topic.errors[:name]).to include("only allow letters, numbers, and dashes")
    end

  end
end
