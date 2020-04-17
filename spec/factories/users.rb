FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Lorem.characters(number:4) }
    name_kana { Faker::Lorem.characters(number:8) }
    nickname { Faker::Lorem.characters(number:3) }
    sex { Faker::Boolean.boolean }
    age { Faker::Number.between(from: 1, to: 5) }
    prefecture { Faker::Number.between(from: 1, to: 5) }
    city { Faker::Lorem.characters(number:3) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end