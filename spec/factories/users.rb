# spec/factories/users.rb
puts "Loading factory file: #{__FILE__}"
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    role { %w[editor subscriber author].sample }

    after(:build) do |user|
      user.image.attach(io: File.open(Rails.root.join('spec', 'support', 'assets', 'test.png')), filename: 'test.png', content_type: 'image/png')
    end
  end
end
