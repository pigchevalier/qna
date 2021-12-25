FactoryBot.define do
  factory :question do
    title { "MyString" }
    body { "MyText" }
    user { nil }

    trait :invalid do
      title { nil }
    end
  end
end
