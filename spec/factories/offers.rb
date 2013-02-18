require 'factory_girl'

FactoryGirl.define do 
  factory :offer do
    title 	"One offer"
    payout 	"1234"
    thumbnail "http://www.sponsorpay.com"
  end
end