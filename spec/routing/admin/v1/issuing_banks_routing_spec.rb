require 'rails_helper'

RSpec.describe Admin::V1::IssuingBanksController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/v1/issuing_banks').to route_to('admin/v1/issuing_banks#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/admin/v1/issuing_banks/1').to route_to('admin/v1/issuing_banks#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/admin/v1/issuing_banks').to route_to('admin/v1/issuing_banks#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/v1/issuing_banks/1').to route_to('admin/v1/issuing_banks#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/v1/issuing_banks/1').to route_to('admin/v1/issuing_banks#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/v1/issuing_banks/1').to route_to('admin/v1/issuing_banks#destroy', id: '1', format: :json)
    end
  end
end
