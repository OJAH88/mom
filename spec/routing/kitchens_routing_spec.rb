require "rails_helper"

RSpec.describe KitchensController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/kitchens").to route_to("kitchens#index")
    end

    it "routes to #show" do
      expect(get: "/kitchens/1").to route_to("kitchens#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/kitchens").to route_to("kitchens#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/kitchens/1").to route_to("kitchens#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/kitchens/1").to route_to("kitchens#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/kitchens/1").to route_to("kitchens#destroy", id: "1")
    end
  end
end
