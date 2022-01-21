json.extract! payment, :id, :billing_type, :amount, :due_date, :created_at, :updated_at

json.user do
  json.name payment.user.name
  json.cpf payment.user.cpf
  json.email payment.user.email
end

json.hash_boleto json.payment.code unless payment.billing_type