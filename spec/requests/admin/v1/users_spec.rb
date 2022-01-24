require 'rails_helper'
require 'byebug'

RSpec.describe '/admin/v1/users', type: :request do
  let(:valid_attributes) do
    {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      cpf: Faker::Number.number(digits: 11).to_s
    }
  end

  let(:invalid_attributes) do
    {
      name: ''
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      User.create! valid_attributes
      get admin_v1_users_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      get admin_v1_user_url(user), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post admin_v1_users_url,
               params: { user: valid_attributes }, headers: valid_headers, as: :json
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new admin/v1_user' do
        post admin_v1_users_url,
             params: { user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json; charset=utf-8'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post admin_v1_users_url,
               params: { user: invalid_attributes }, as: :json
        end.to change(User, :count).by(0)
      end

      it 'renders a JSON response with errors for the new admin/v1_user' do
        post admin_v1_users_url,
             params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Test',
          email: Faker::Internet.email,
          cpf: Faker::Number.number(digits: 11).to_s
        }
      end

      it 'updates the requested admin/v1_user' do
        user = User.create! valid_attributes
        patch admin_v1_user_url(user),
              params: { user: new_attributes }, headers: valid_headers, as: :json
        user.reload

        expect(user.name).to eq(new_attributes[:name])
        expect(user.email).to eq(new_attributes[:email])
        expect(user.cpf).to eq(new_attributes[:cpf])
      end

      it 'renders a JSON response with the admin/v1_user' do
        user = User.create! valid_attributes
        patch admin_v1_user_url(user),
              params: { user: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json; charset=utf-8'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the admin/v1_user' do
        user = User.create! valid_attributes
        patch admin_v1_user_url(user),
              params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested admin/v1_user' do
      user = User.create! valid_attributes
      expect do
        delete admin_v1_user_url(user), headers: valid_headers, as: :json
      end.to change(User, :count).by(-1)
    end
  end
end
