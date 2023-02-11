FactoryBot.define do
  factory :category do
    # name { "MyString" }
    name { Faker::Lorem.word }
    
  end
end
