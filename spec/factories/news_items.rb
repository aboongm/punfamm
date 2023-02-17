FactoryBot.define do
  factory :news_item do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    author_id { create(:user, role: :author).id }
    category { create(:category) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test.jpg'), 'image/jpeg') }
  end
end
