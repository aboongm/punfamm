require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a new user' do
      @user = User.new(
        name: 'John Doe',
        email: 'john@doe.com',
        password: 'password',
        password_confirmation: 'password',
        role: 0
      )
      expect(@user).to be_valid
    end
  end
end
