FactoryBot.define do
  factory :category do
    name { Faker::Lorem.characters(number:4) }
    is_active { Faker::Boolean.boolean }
  end
end