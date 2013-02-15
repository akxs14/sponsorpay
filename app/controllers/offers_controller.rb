require 'digest/sha1'

class OffersController < ApplicationController
  @@APIKey = "b07a12df7d52e6c118e5d47d3f9e60135b109a1f"
  @@url = "http://api.sponsorpay.com/feed/v1/offers.json?"

  def list
    puts request_string params
  end

  private

  def request_string params
    req_params    = assign_params params
    sorted_params =  req_params.sort_by { |key,value| key }
    parameter_str = assemble_param_str sorted_params
    hash          = create_hash parameter_str + @@APIKey
    @@url + parameter_str + "hash_key=" + hash
  end

  def assign_params params
    req_params = Hash.new
    req_params[:appid] = "157"
    req_params[:uid] = params[:uid]
    req_params[:ip] = "109.235.143.113"
    req_params[:locale] = "de"
    req_params[:device_id] = "\"2b6f0cc904d137be2 e1730235f5664094b 831186\""
    req_params[:pub0] = params[:pub0]
    req_params[:timestamp] = Time.now.to_i.to_s
    req_params[:offer_types] = 112
    req_params
  end

  def assemble_param_str sorted_params
    parameter_str = ""
    sorted_params.each do |parameter|
      parameter_str << parameter[0].to_s + "=" + parameter[1].to_s + "&"
    end
    parameter_str
  end

  def create_hash string
    Digest::SHA1.hexdigest string
  end

end
