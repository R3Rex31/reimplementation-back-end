require "rails_helper"

RSpec.describe BadgesController, type: :routing do
  describe "routing" do
    it "routes to #index" do # Ensures that the GET request to /badges is routed to the index action 
      expect(get: "/badges").to route_to("badges#index")
    end

    it "routes to #show" do # Ensures that the GET request to /badges/1 is routed to the show action 
      expect(get: "/badges/1").to route_to("badges#show", id: "1")
    end


    it "routes to #create" do # Ensures that the POST request to /badges is routed to the create action 
      expect(post: "/badges").to route_to("badges#create")
    end

    it "routes to #update via PUT" do # Ensures that the PUT request to /badges/1 is routed to the update action 
      expect(put: "/badges/1").to route_to("badges#update", id: "1")
    end

    it "routes to #update via PATCH" do # Ensures that the PATCH request to /badges/1 is routed to the update action 
      expect(patch: "/badges/1").to route_to("badges#update", id: "1")
    end

    it "routes to #destroy" do # Ensures that the DELETE request to /badges/1 is routed to the destroy action 
      expect(delete: "/badges/1").to route_to("badges#destroy", id: "1")
    end
  end
end
