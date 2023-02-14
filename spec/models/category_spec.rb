require 'rails_helper'


RSpec.describe Category, type: :model do
    describe 'Validations' do
        it 'is valid with valid attributes' do
        @category = Category.new(
            title: 'World'
        )
        expect(@category).to be_valid
        end
        it 'is not valid without a title' do
        @category = Category.new(
            title: nil
        )
        expect(@category).to_not be_valid
        end
    end
end