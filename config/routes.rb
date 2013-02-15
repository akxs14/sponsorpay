Sponsorpay::Application.routes.draw do
  root :to => "offers#get"
  get "/offers/get" => "offers#get"
  get "/offers" => "offers#list"
end
