FactoryBot.define do
  factory :answer do
    body { "MyText" }
    question { nil }
    user { nil }

    trait :invalid do
      body { nil }
    end
  end
end
