require "rails_helper"

RSpec.describe FoodLogsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/food_logs").to route_to("food_logs#index")
    end

    it "routes to #show" do
      expect(get: "/food_logs/1").to route_to("food_logs#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/food_logs").to route_to("food_logs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/food_logs/1").to route_to("food_logs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/food_logs/1").to route_to("food_logs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/food_logs/1").to route_to("food_logs#destroy", id: "1")
    end
  end
end
