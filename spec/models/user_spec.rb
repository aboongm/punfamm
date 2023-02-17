require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }

    # THE FOLLOWING TESTS ARE THE SAME AS THE ABOVE TESTS
    # let(:user) { build(:user) }

    # it 'is valid with valid attributes' do
    #   expect(user).to be_valid
    # end

    # it 'is not valid without a role' do
    #   user.role = nil
    #   expect(user).to_not be_valid
    # end

    # it 'is not valid without an email' do
    #   user.email = nil
    #   expect(user).to_not be_valid
    # end

    # it 'is not valid with a duplicate email' do
    #   create(:user, email: user.email)
    #   expect(user).to_not be_valid
    # end

    # it 'is not valid without a password' do
    #   user.password = nil
    #   expect(user).to_not be_valid
    # end

    # it 'is not valid with a short password' do
    #   user.password = '12345'
    #   expect(user).to_not be_valid
    # end
  end

  describe 'associations' do
    it { should have_many(:news_items).dependent(:destroy).with_foreign_key(:author_id) }
    it { should have_many(:dailies).dependent(:destroy).with_foreign_key(:editor_id) }
  end

  describe 'roles' do    
    # let(:user) { create(:user) } # THIS WORKS TOO
     let(:user) { build(:user) }

    it "has a role" do
      expect(user.role).to be_present
    end

    it "can be an editor" do
      user.update(role: "editor")
      expect(user.editor?).to be true
    end

    it "can be a subscriber" do
      user.update(role: "subscriber")
      expect(user.subscriber?).to be true
    end

    it "can be an author" do
      user.update(role: "author")
      expect(user.author?).to be true
    end

    # THE FOLLOWING TESTS ARE THE SAME AS THE ABOVE TESTS
    # let(:user) { build(:user) }

    # it 'returns true for editor role' do
    #   user.role = 'editor'
    #   expect(user.editor?).to be_truthy
    # end

    # it 'returns true for subscriber role' do
    #   user.role = 'subscriber'
    #   expect(user.subscriber?).to be_truthy
    # end

    # it 'returns true for author role' do
    #   user.role = 'author'
    #   expect(user.author?).to be_truthy
    # end
  end
end
