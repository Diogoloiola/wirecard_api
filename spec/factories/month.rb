FactoryBot.define do
  factory :month do
    month_code { Faker::Number.number(digits: 1)}
    year_id { nil }
  end
end
