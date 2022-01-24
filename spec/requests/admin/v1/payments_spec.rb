# require 'rails_helper'

# RSpec.describe '/admin/v1/payments', type: :request do
#   let(:user) { create(:user) }
#   let(:issuing_bank) { create(:issuing_bank) }
#   let(:card) do
#     Card.create!(holder_name: user.name, number: Faker::Number.number(digits: 5),
#                  expiration: '20/10/2022', cvv: Faker::Number.number(digits: 5).to_s, user_id: user.id,
#                  issuing_bank_id: issuing_bank.id, balance: 2000, fixed_balance: 2000,
#                  invoice_due_date: (Time.zone.now + 1.month))
#   end

#   let(:valid_attributes) do
#     {
#       client_id: user.id,
#       buyer: {
#         name: user.name,
#         email: user.email,
#         cpf: user.cpf
#       },
#       card: {
#         holder_name: user.name,
#         number: card.number,
#         expiration_date: card.invoice_due_date,
#         cvv: card.cvv
#       },
#       payment: {
#         amount: 1000,
#         billing_type: 1
#       }

#     }
#   end

#   let(:invalid_attributes) do
#     skip('Add a hash of attributes invalid for your model')
#   end

#   let(:valid_headers) do
#     {}
#   end

#   describe 'GET /index' do
#     it 'renders a successful response' do
#       Payment.create! valid_attributes
#       get admin_v1_payments_url, headers: valid_headers, as: :json
#       expect(response).to be_successful
#     end
#   end

#   describe 'GET /show' do
#     it 'renders a successful response' do
#       payment = Payment.create! valid_attributes
#       get admin_v1_payment_url(payment), as: :json
#       expect(response).to be_successful
#     end
#   end

#   describe 'POST /create' do
#     context 'with valid parameters' do
#       it 'creates a new Payment' do
#         expect do
#           post admin_v1_payments_url,
#                params: { payment: valid_attributes }, headers: valid_headers, as: :json
#         end.to change(Payment, :count).by(1)
#       end

#       it 'renders a JSON response with the new admin/v1_payment' do
#         post admin_v1_payments_url,
#              params: { payment: valid_attributes }, headers: valid_headers, as: :json
#         expect(response).to have_http_status(:created)
#         expect(response.content_type).to match(a_string_including('application/json'))
#       end
#     end

#     context 'with invalid parameters' do
#       it 'does not create a new Payment' do
#         expect do
#           post admin_v1_payments_url,
#                params: { payment: invalid_attributes }, as: :json
#         end.to change(Payment, :count).by(0)
#       end

#       it 'renders a JSON response with errors for the new admin/v1_payment' do
#         post admin_v1_payments_url,
#              params: { payment: invalid_attributes }, headers: valid_headers, as: :json
#         expect(response).to have_http_status(:unprocessable_entity)
#         expect(response.content_type).to eq('application/json')
#       end
#     end
#   end
# end
