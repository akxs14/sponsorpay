require 'httparty'
require 'json'

class OffersController < ApplicationController
  include Request

  def list
    req_url = request_string params
    response = HTTParty.get(req_url)
    @offers = []

    puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    puts response.keys
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    puts response.headers["x-sponsorpay-response-signature"]
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<"    
    puts verify_response(response, response.headers["x-sponsorpay-response-signature"])
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<"


    response["offers"].each do |item|
      offer = Offer.new
      offer.title, offer.payout, offer.thumbnail = item["title"], item["payout"], item["thumbnail"]
      @offers.push(offer)
    end
  end

end
