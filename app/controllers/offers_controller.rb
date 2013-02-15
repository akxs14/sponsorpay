require 'httparty'
require 'json'

class OffersController < ApplicationController
  include Request

  def submit
    req_url = request_string params
    response = HTTParty.get(req_url)
    redirect_to "/offers"
  end

end
