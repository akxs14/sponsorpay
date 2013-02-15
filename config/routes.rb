Sponsorpay::Application.routes.draw do

  root :to => "offers#get"

  get "/offers/get" => "offers#get"
  post "/offers/get" => "offers#submit"
  get "/offers" => "offers#list"

end
