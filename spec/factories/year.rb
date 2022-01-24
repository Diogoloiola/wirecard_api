FactoryBot.define do
  factory :year do
    year { Faker::Number.number(digits: 4)}
  end
end
