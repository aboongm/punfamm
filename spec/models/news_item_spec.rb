require 'rails_helper'


RSpec.describe NewsItem, type: :model do
    describe 'Validations' do
        it 'is not valid without a title' do
        @news_item = NewsItem.new(
            title: nil
        )
        expect(@news_item).to_not be_valid
        end
        it 'is not valid without a content' do
        @news_item = NewsItem.new(
            content: nil
        )
        expect(@news_item).to_not be_valid
        end
    end
end