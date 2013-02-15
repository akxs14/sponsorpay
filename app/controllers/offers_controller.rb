require 'httparty'
require 'json'

class OffersController < ApplicationController
  include Request

  def list
    req_url = request_string params
    response = HTTParty.get(req_url)
    @offers = []

    response["offers"].each do |item|
      offer = Offer.new
      offer.title, offer.payout = item["title"], item["payout"]
      offer.thumbnail = item["thumbnail"]
      @offers.push(offer)
    end
  end
end
