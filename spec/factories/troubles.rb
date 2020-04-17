FactoryBot.define do
  factory :trouble do
    title { Faker::Lorem.characters(number:5) }
    body { Faker::Lorem.characters(number:200) }
    category_id { Faker::Number.between(from: 1, to: 5) }
    user
  end
end