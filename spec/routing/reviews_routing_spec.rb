require "spec_helper"

describe ReviewsController do
  describe "routing" do

    it "routes to #index" do
      get("/products/1/reviews").should route_to("reviews#index", :product_id => "1")
    end

    it "routes to #new" do
      get("/products/1/reviews/new").should route_to("reviews#new", :product_id => "1")
    end

    it "routes to #create" do
      post("/products/1/reviews").should route_to("reviews#create", :product_id => "1")
    end
    
    it "routes to #destroy" do
      delete("/products/1/reviews/1").should route_to("reviews#destroy", :id => "1", :product_id => "1")
    end

  end
end
