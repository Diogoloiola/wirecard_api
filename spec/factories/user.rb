FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    cpf { Faker::Number.number(digits: 11).to_s }
  end
end
