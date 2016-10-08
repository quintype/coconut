class StoryController < ApplicationController

  def index
    @story = Story.find_by_slug(params[:story_slug])
    raise ActionController::RoutingError.new('Not Found') unless @story

    @authors = get_authors
  end

  private
    def get_authors
      return @story.authors if @story.authors
      author = Author.get(@story.author_id.to_s)
      if author.present?
        [author]
      else
        []
      end
    end
end
