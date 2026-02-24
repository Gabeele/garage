class Post < ApplicationRecord
  has_one :user
  belongs_to :topic
end
