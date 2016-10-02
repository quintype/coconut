STORY_FORMAT = "/:section/:year/:month/:day/:story_slug"
SECTION_FORMAT = "/section/:section_slug"

Rails.application.routes.draw do
  get "/ping" => "system#ping"

  get "/preview/story" => "stories#preview"
  get "/preview/home" => "home#preview"

  get "/search" => "home#search"
  get "/topic/:tag_name" => "home#tag"

  get SECTION_FORMAT => "home#section"
  get STORY_FORMAT => "stories#show"
  root to: "home#index"
end
