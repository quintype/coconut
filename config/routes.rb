Rails.application.routes.draw do
  get "/ping" => "system#ping"
  root to: "home#index"
end
