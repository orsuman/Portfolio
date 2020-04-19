FactoryBot.define do
  factory :message do
    content { Faker::Lorem.characters(number:5) }
  end
end