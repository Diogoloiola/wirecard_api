require 'rails_helper'

RSpec.describe '/admin/v1/cards', type: :request do
  let(:user) { create(:user) }
  let(:issuing_bank) { create(:issuing_bank) }

  let(:valid_attributes) do
    { holder_name: 'Teste', expiration: '10/10/2022', cvv: '123123', user_id: user.id, issuing_bank_id: issuing_bank.id,
      balance: 2000, invoice_due_date: Time.zone.now + 1.month, fixed_balance: 3000, number: 3001 }
  end

  let(:invalid_attributes) do
    { holder_name: '' }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Card.create! valid_attributes
      get admin_v1_cards_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      card = Card.create! valid_attributes
      get admin_v1_card_url(card), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Card' do
        expect do
          post admin_v1_cards_url,
               params: { card: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Card, :count).by(1)
      end

      it 'renders a JSON response with the new admin' do
        post admin_v1_cards_url,
             params: { card: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json; charset=utf-8'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Card' do
        expect do
          post admin_v1_cards_url,
               params: { card: invalid_attributes }, as: :json
        end.to change(Card, :count).by(0)
      end

      it 'renders a JSON response with errors for the new admin' do
        post admin_v1_cards_url,
             params: { card: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { holder_name: 'Teste 02', expiration: '10/10/2023', cvv: '1238761', user_id: user.id,
          issuing_bank_id: issuing_bank.id, balance: 2000, invoice_due_date: Time.zone.now + 1.month,
          fixed_balance: 3000, number: 3001 }
      end

      it 'updates the requested admin' do
        card = Card.create! valid_attributes
        patch admin_v1_card_url(card),
              params: { card: new_attributes }, headers: valid_headers, as: :json
        card.reload
      end

      it 'renders a JSON response with the admin' do
        card = Card.create! valid_attributes
        patch admin_v1_card_url(card),
              params: { card: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json; charset=utf-8'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the admin' do
        card = Card.create! valid_attributes
        patch admin_v1_card_url(card),
              params: { card: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested admin' do
      card = Card.create! valid_attributes
      expect do
        delete admin_v1_card_url(card), headers: valid_headers, as: :json
      end.to change(Card, :count).by(-1)
    end
  end
end
