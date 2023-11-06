require "rails_helper"

RSpec.describe DutiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do #Verifies that the GET request to /duties is correctly routed to the index action of the DutiesController.
      expect(get: "/duties").to route_to("duties#index")
    end

    it "routes to #show" do # Ensures that the GET request to /duties/1 is properly routed to the show action of the DutiesController
      expect(get: "/duties/1").to route_to("duties#show", id: "1")
    end


    it "routes to #create" do # Validates that the POST request to /duties is routed to the create action 
      expect(post: "/duties").to route_to("duties#create")
    end

    it "routes to #update via PUT" do # Validates that the PUT request to /duties/1 is routed to the update action 
      expect(put: "/duties/1").to route_to("duties#update", id: "1")
    end

    it "routes to #update via PATCH" do # Validates that the PATCH request to /duties/1 is routed to the update action 
      expect(patch: "/duties/1").to route_to("duties#update", id: "1")
    end

    it "routes to #destroy" do # Ensures that the DELETE request to /duties/1 is routed to the destroy action
      expect(delete: "/duties/1").to route_to("duties#destroy", id: "1")
    end
  end
end
