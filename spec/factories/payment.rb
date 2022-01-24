FactoryBot.define do
  factory :payment do
    amount { 1000 }
    billing_type { 1 }
    user_id { nil }
    month_id { nil }
    code { nil }
  end
end
