User.destroy_all
Card.destroy_all
IssuingBank.destroy_all
IssuingBankPart.destroy_all

10.times do
  user = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.email,
                      cpf: Faker::Number.number(digits: 11).to_s)

  credit_cart = Card.create!(holder_name: user.name, number: Faker::Number.number(digits: 5),
                             expiration: '20/10/2022', cvv: Faker::Number.number(digits: 5).to_s, user_id: user.id)

  issuing_bank = IssuingBank.create!(name: Faker::Name.unique.name)

  IssuingBankPart.create!(card_id: credit_cart.id, issuing_bank_id: issuing_bank.id, status: true, balance: 2000.0)
end
