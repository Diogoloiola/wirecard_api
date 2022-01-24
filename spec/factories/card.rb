FactoryBot.define do
  factory :card do
    holder_name { Faker::Name.name }
    expiration { '10/10/2022' }
    cvv { '12312' }
    user_id { nil }
    issuing_bank_id { nil }
    invoice_due_date { Time.zone.now + 1.month }
    balance { 2000 }
    fixed_balance { 2000 }
  end
end
