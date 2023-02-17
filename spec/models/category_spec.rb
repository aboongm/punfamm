# spec/models/category_spec.rb

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
  end

  describe 'associations' do
    it { should have_many(:news_items).dependent(:destroy) }
  end

  describe 'factory' do
    it 'is valid' do
      expect(category).to be_valid
    end

    it 'has a unique title' do
      other_category = create(:category)
      expect(other_category.title).not_to eq(category.title)
    end
  end
end
