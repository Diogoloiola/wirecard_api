require "rails_helper"

RSpec.describe Admin::V1::PaymentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/v1/payments").to route_to("admin/v1/payments#index")
    end

    it "routes to #show" do
      expect(get: "/admin/v1/payments/1").to route_to("admin/v1/payments#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin/v1/payments").to route_to("admin/v1/payments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/v1/payments/1").to route_to("admin/v1/payments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/v1/payments/1").to route_to("admin/v1/payments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/v1/payments/1").to route_to("admin/v1/payments#destroy", id: "1")
    end
  end
end
