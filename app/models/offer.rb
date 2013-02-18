class Offer < ActiveRecord::Base
  attr_reader :payout, :thumbnail, :title
  attr_writer :payout, :thumbnail, :title

  def initialize(title = nil, payout = nil, thumbnail = nil)
  	@title, @payout, @thumbnail = title, payout, thumbnail
  	super()
  end

end
