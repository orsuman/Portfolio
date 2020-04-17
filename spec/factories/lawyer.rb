FactoryBot.define do
  factory :lawyer do
    email { Faker::Internet.email }
    name { Faker::Lorem.characters(number:4) }
    name_kana { Faker::Lorem.characters(number:8) }
    office { Faker::Lorem.characters(number:7) }
    profession { Faker::Number.between(from: 1, to: 5) }
    sex { Faker::Boolean.boolean }
    age { Faker::Number.between(from: 1, to: 5) }
    postal_code { Faker::Lorem.characters(number:7) }
    prefecture { Faker::Number.between(from: 1, to: 5) }
    address { Faker::Lorem.characters(number:10) }
    phone_number { Faker::Lorem.characters(number:10) }
    url { "http://" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end