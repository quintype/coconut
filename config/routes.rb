STORY_FORMAT = "/:section/:year/:month/:day/:story_slug"
SECTION_FORMAT = "/section/:section_slug"

Rails.application.routes.draw do
  get "/ping" => "system#ping"

  namespace :preview do
    get "/story", action: "story"
    get "/home", action: "home"
  end

  get "/search" => "home#search"
  get "/topic/:tag_name" => "home#tag"

  get SECTION_FORMAT => "home#section"
  get STORY_FORMAT => "story#index"
  root to: "home#index"
end
