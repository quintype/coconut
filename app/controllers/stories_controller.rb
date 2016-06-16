class StoriesController < ApplicationController
  def show
    @story = Story.find_by_slug(params[:story_slug])
    raise ActionController::RoutingError.new('Not Found') unless @story
  end
end