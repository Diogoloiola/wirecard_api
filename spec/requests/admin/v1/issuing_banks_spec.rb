require 'rails_helper'

RSpec.describe '/admin/v1/issuing_banks', type: :request do
  let(:valid_attributes) do
    { name: 'Bank test' }
  end

  let(:invalid_attributes) do
    { name: '' }
  end
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      IssuingBank.create! valid_attributes
      get admin_v1_issuing_banks_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      issuing_bank = IssuingBank.create! valid_attributes
      get admin_v1_issuing_bank_url(issuing_bank), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new IssuingBank' do
        expect do
          post admin_v1_issuing_banks_url,
               params: { issuing_bank: valid_attributes }, headers: valid_headers, as: :json
        end.to change(IssuingBank, :count).by(1)
      end

      it 'renders a JSON response with the new admin' do
        post admin_v1_issuing_banks_url,
             params: { issuing_bank: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json; charset=utf-8'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new IssuingBank' do
        expect do
          post admin_v1_issuing_banks_url,
               params: { issuing_bank: invalid_attributes }, as: :json
        end.to change(IssuingBank, :count).by(0)
      end

      it 'renders a JSON response with errors for the new admin' do
        post admin_v1_issuing_banks_url,
             params: { issuing_bank: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'New bank' }
      end

      it 'updates the requested admin' do
        issuing_bank = IssuingBank.create! valid_attributes
        patch admin_v1_issuing_bank_url(issuing_bank),
              params: { issuing_bank: new_attributes }, headers: valid_headers, as: :json
        issuing_bank.reload
      end

      it 'renders a JSON response with the admin' do
        issuing_bank = IssuingBank.create! valid_attributes
        patch admin_v1_issuing_bank_url(issuing_bank),
              params: { issuing_bank: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json; charset=utf-8'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the admin' do
        issuing_bank = IssuingBank.create! valid_attributes
        patch admin_v1_issuing_bank_url(issuing_bank),
              params: { issuing_bank: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested admin' do
      issuing_bank = IssuingBank.create! valid_attributes
      expect do
        delete admin_v1_issuing_bank_url(issuing_bank), headers: valid_headers, as: :json
      end.to change(IssuingBank, :count).by(-1)
    end
  end
end
