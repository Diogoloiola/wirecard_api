require "rails_helper"

RSpec.describe Admin::V1::CardsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/v1/cards").to route_to("admin/v1/cards#index")
    end

    it "routes to #show" do
      expect(get: "/admin/v1/cards/1").to route_to("admin/v1/cards#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin/v1/cards").to route_to("admin/v1/cards#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/v1/cards/1").to route_to("admin/v1/cards#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/v1/cards/1").to route_to("admin/v1/cards#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/v1/cards/1").to route_to("admin/v1/cards#destroy", id: "1")
    end
  end
end
