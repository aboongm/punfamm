FactoryBot.define do
  factory :daily do
    posted_date { Time.now }
    editor_id { create(:user, role: :editor).id }
  end
end