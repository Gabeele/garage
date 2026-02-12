FactoryBot.define do
  factory :topic do
    name { Faker::Lorem.word.unique}
    association :user
  end
end