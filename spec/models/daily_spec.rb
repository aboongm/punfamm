require 'rails_helper'

RSpec.describe Daily, type: :model do
  describe 'associations' do
    it { should belong_to(:editor).class_name('User').with_foreign_key('editor_id') }
    it { should have_many(:news_item_dailies).dependent(:destroy) }
    it { should have_many(:news_items).through(:news_item_dailies) }
  end

  describe 'creation' do
    let!(:editor) { create(:user, role: 'editor') }

    it 'creates a new Daily' do
      daily = create(:daily, editor: editor)
      expect(daily).to be_valid
    end
  end
end
