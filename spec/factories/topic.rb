FactoryBot.define do
  factory :topic do
    name { Faker::Lorem.word }
    association :user
  end
end