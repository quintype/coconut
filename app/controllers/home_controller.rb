class HomeController < ApplicationController
  def index
    @stories = Story.fetch("top", limit: 100)
  end

  def search
    @stories = Story.search(q: params[:q]).stories
  end

  def section
    section = @config.sections.find {|section| section.slug == params[:section_slug]}
    if section
      @stories = Story.fetch("top", "section-id": section.id)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def tag
    @stories = Story.fetch("top", "tag": params[:tag_name])
  end
end
