FactoryBot.define do
  factory :inquiry do
  	subject { Faker::Number.between(from: 1, to: 3) }
  	email { Faker::Internet.email }
  	send_email { Faker::Internet.email }
    name { Faker::Lorem.characters(number:4) }
    name_kana { Faker::Lorem.characters(number:6) }
    sex { Faker::Boolean.boolean }
    is_user { Faker::Boolean.boolean }
    content { Faker::Lorem.characters(number:200) }
  end
end
