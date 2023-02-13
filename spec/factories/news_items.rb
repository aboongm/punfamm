FactoryBot.define do
  factory :news_item do
    headline { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    association :reporter, factory: :user, trait: [:reporter]
  end
end
