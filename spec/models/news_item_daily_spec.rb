RSpec.describe NewsItemDaily, type: :model do
  describe 'associations' do
    it { should belong_to(:news_item) }
    it { should belong_to(:daily) }
  end
end
