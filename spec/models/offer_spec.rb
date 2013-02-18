require 'spec_helper'

describe Offer do
  it "should contain a valid factory" do
    FactoryGirl.create(:offer).should be_valid
  end

  it "should contain title, payout and thumbnail after its initialization" do
    offer = FactoryGirl.create(:offer, title: "ABC", payout: "1234", thumbnail: "http://www.sponsorpay.com")
  end

  {"title" => "a new title", "payout" => "4567", "thumbnail" => "www.anothersponsor.com"}.each do |k, v|
    it "should allow to set #{k}" do
      offer = FactoryGirl.create(:offer)
      offer.send("#{k}=", v)
      offer.send("#{k}") == v
    end
  end

  {"title" => "One offer", "payout" => "1234", "thumbnail" => "http://www.sponsorpay.com"}.each do |k, v|
    it "should get the correct value of #{k}" do
      offer = FactoryGirl.create(:offer)
      offer.send("#{k}") == v
    end
  end
end 
