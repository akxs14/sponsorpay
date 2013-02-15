require 'httparty'
require 'json'

class OffersController < ApplicationController
  include Request

  def list
    req_url = request_string params
    response = HTTParty.get(req_url)
    @offers, @verified = [], verify_response(response.body, response.headers["x-sponsorpay-response-signature"])

    if @verified
      response["offers"].each {|item| @offers.push(Offer.new(item["title"], item["payout"], item["thumbnail"])) }
    end
  end

end
