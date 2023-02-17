# FactoryBot.define do
#   factory :news_item_daily do
#     news_item
#     daily
#   end
# end

FactoryBot.define do
  factory :news_item_daily do
    news_item
    daily
  end

  factory :news_item_daily_with_associations, class: 'NewsItemDaily' do
    association :news_item
    association :daily
  end
end
