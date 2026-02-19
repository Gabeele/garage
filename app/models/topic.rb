class Topic < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: { message: "is already taken" },
            length: { in: 1..20 },
            format: { with: /\A[a-zA-Z0-9-]+\z/, message: "only allow letters, numbers, and dashes" }
  belongs_to :user

  before_validation { self.name = name.downcase if name.present? }

  def slug
    "g/#{self.name}"
  end
end
