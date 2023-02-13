FactoryBot.define do
  factory :daily_news_item do
    headline { "MyString" }
    content { "MyText" }
    date { "2023-02-13" }
    editor { nil }
  end
end
