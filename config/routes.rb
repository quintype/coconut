Rails.application.routes.draw do
  get "/ping" => "system#ping"

  get "/:section/:year/:month/:day/:story_slug" => "stories#show"
  get "/preview/story" => "stories#preview"

  root to: "home#index"
end
