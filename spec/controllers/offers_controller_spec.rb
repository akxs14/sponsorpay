require 'spec_helper'

describe OffersController do
  describe "GET /offers/get" do
    it "renders the get template" do
      get :get
      response.should render_template("get")
    end

    it "should get the request form" do
      get :get
      assert_response :success
    end
  end

  describe "GET /offers" do
    it "renders the list template" do
      get :list
      response.should render_template("list")
    end

    it "fetches the list of available offers" do
      get :list
      @offers.should_not eq([]) 
    end

    it "contains the verification of the respone's signature" do
      get :list
      @verified == true
    end

    it "should get the list of available offers" do
      get :list
      assert_response :success
    end

  end
end
