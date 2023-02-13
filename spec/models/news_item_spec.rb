require 'rails_helper'

RSpec.describe NewsItem, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:headline) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:date) }
    it { should belong_to(:reporter) }
  end
  
  # describe 'associations' do
  #   #  let(:news_item) { create(:news_item) }
  #   it { should delegate_method(:role).to(:reporter).with_prefix }
  # end

  describe NewsItem do
  let(:reporter) { FactoryBot.create(:user, :reporter) }

  it "creates a news item with a valid reporter" do
    news_item = FactoryBot.create(:news_item, reporter: reporter)
    binding.pry
    expect(news_item).to be_valid
  end
end


  
  # describe 'delegation' do
  #   reporter = FactoryBot.create(:user, :reporter)
  #   news_item = FactoryBot.create(:news_item, reporter: reporter)
    
  #   it 'delegates role to reporter' do
  #     binding.pry    
  #     expect(news_item.reporter.role).to eq('reporter')
  #   end
  # end

  # describe 'factory' do
  #   it 'has a valid factory' do
  #     expect(build(:news_item)).to be_valid
  #   end
  # end
end
