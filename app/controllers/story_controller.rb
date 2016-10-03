class StoryController < ApplicationController

  def story
    @story = Story.find_by_slug(params[:story_slug]).to_liquid
    raise ActionController::RoutingError.new('Not Found') unless @story
  end

end
