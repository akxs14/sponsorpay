require 'digest/sha1'

module Request
  @@APIKey = "b07a12df7d52e6c118e5d47d3f9e60135b109a1f"
  @@url = "http://api.sponsorpay.com/feed/v1/offers.json?"

  def request_string params
    req_params    = assign_params params
    sorted_params = sort_param_hash req_params
    parameter_str = assemble_param_str sorted_params
    hash          = create_hash parameter_str
    @@url + parameter_str + "&hashkey=" + hash
  end

  def assign_params params
    req_params = Hash.new
    req_params["appid"] = 157
    req_params["uid"] = params[:uid]
    req_params["device_id"] = '2b6f0cc904d137be2e1730235f5664094b831186'
    req_params["ip"] = "109.235.143.113"
    req_params["locale"] = "de"
    req_params["offer_types"] = 112
    req_params["pub0"] = params[:pub0]
    req_params["page"] = params[:page]    
    req_params["timestamp"] = Time.now.to_i
    req_params
  end

  def sort_param_hash param_hash
    sorted_hash = Hash.new
    param_hash.sort.map { |key,value| sorted_hash[key] = value }
    sorted_hash
  end

  def assemble_param_str sorted_params
    URI.escape(sorted_params.collect{|key,value| "#{key}=#{value}"}.join('&'))
  end

  def create_hash string  
    Digest::SHA1.hexdigest("#{string}&#{@@APIKey}")
  end

end
