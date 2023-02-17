require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { build(:user) }

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a role' do
      user.role = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid with a duplicate email' do
      create(:user, email: user.email)
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'is not valid with a short password' do
      user.password = '12345'
      expect(user).to_not be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:news_items).dependent(:destroy) }   
  end

  describe 'roles' do
    let(:user) { build(:user) }

    it 'returns true for editor role' do
      user.role = 'editor'
      expect(user.editor?).to be_truthy
    end

    it 'returns true for subscriber role' do
      user.role = 'subscriber'
      expect(user.subscriber?).to be_truthy
    end

    it 'returns true for author role' do
      user.role = 'author'
      expect(user.author?).to be_truthy
    end
  end
end
