class Topic < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: { scope: :user_id},
            length: { in: 1..20 },
            format: { with: /\A[a-zA-Z0-9-]+\z/, message: "only allow letters, numbers, and dashes" }
  belongs_to :user
end
