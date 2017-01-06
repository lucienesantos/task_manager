require "rails_helper"

RSpec.describe KeepsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/keeps").to route_to("keeps#index")
    end

    it "routes to #show" do
      expect(:get => "/keeps/1").to route_to("keeps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/keeps/1/edit").to route_to("keeps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/keeps").to route_to("keeps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/keeps/1").to route_to("keeps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/keeps/1").to route_to("keeps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/keeps/1").to route_to("keeps#destroy", :id => "1")
    end

  end
end
