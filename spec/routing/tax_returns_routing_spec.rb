require "spec_helper"

describe TaxReturnsController do
  describe "routing" do

    it "routes to #index" do
      get("/tax_returns").should route_to("tax_returns#index")
    end

    it "routes to #new" do
      get("/tax_returns/new").should route_to("tax_returns#new")
    end

    it "routes to #show" do
      get("/tax_returns/1").should route_to("tax_returns#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tax_returns/1/edit").should route_to("tax_returns#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tax_returns").should route_to("tax_returns#create")
    end

    it "routes to #update" do
      put("/tax_returns/1").should route_to("tax_returns#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tax_returns/1").should route_to("tax_returns#destroy", :id => "1")
    end

  end
end
