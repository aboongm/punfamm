require 'rails_helper'

RSpec.describe NewsItem, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { is_expected.to belong_to(:category).class_name('Category').with_foreign_key('category_id') }
    it { is_expected.to have_many(:news_item_dailies).dependent(:destroy) }
    it { is_expected.to have_many(:dailies).through(:news_item_dailies) }
    # it { is_expected.to have_one_attached(:image).dependent(:destroy) }
    it { is_expected.to have_one_attached(:image) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:author_id) }
    it { is_expected.to validate_presence_of(:image) }
  end

  # describe '#add_selected_news_item_to_daily' do
  #   let!(:news_item) { create(:news_item) }
  #   let!(:daily) { create(:daily) }

  #   it 'adds the news item to the daily' do
  #     expect {
  #       news_item.add_selected_news_item_to_daily(daily)
  #     }.to change { daily.news_items.count }.by(1)
  #   end
  # end
end
