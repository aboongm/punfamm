FactoryBot.define do
  factory :news_item do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    author_id { create(:user, role: :author).id }
    category { create(:category) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'assets', 'image.jpg'), 'image/jpeg') }

    after(:create) do |news_item|
      create(:news_item_daily, news_item: news_item)
    end
  end
end

FactoryBot.define do
  factory :news_item_daily do
    news_item
    daily
  end
end
