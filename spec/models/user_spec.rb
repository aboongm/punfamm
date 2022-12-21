require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Validations' do
        it 'is valid with valid attributes' do
        @user = User.new(
            first_name: 'John',
            last_name: 'Doe',
            email: 'john@doe.com',
            password: 'password',
            password_confirmation: 'password'
        )
        expect(@user).to be_valid
        end
        it 'is not valid without an email' do
        @user = User.new(
            first_name: 'John',
            last_name: 'Doe',
            email: nil,
            password: 'password',
            password_confirmation: 'password'
        )
        expect(@user).to_not be_valid
        end
        it 'is not valid without a password' do
        @user = User.new(
            first_name: 'John',
            last_name: 'Doe',
            email: 'john@doe.com',
            password: nil,
            password_confirmation: 'password'
        )
        expect(@user).to_not be_valid
        end
        it 'is not valid if password and password confirmation do not match' do
        @user = User.new(
            first_name: 'John',
            last_name: 'Doe',
            email: 'john@doe.com',
            password: 'password',
            password_confirmation: 'notpassword'
        )
        expect(@user).to_not be_valid
        end
        it 'is not valid if email is not unique' do
        @user1 = User.new(
            first_name: 'John',
            last_name: 'Doe',
            email: 'john@doe.com',
            password: 'password',
            password_confirmation: 'password'
        )
        @user1.save
        @user2 = User.new(
            first_name: 'John',
            last_name: 'Doe',
            email: 'john@doe.com',
            password: 'password',
            password_confirmation: 'password'
        )
        expect(@user2).to_not be_valid
        end
    end
end