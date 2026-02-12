class Topic < ActiveSupport::CurrentAttributes
  validates :name, uniqueness: true, length: { in: 1..20 }
  has_one :user
end
