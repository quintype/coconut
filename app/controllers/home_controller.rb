class HomeController < ApplicationController
  include Stacks

  def index
    request = Quintype::API::Bulk.new
    request.add_request("top", Story.bulk_stories_request("top").add_params(fields: "id,headline,slug,url,hero-image-s3-key,hero-image-metadata,first-published-at,last-published-at,alternative,published-at,author-name,author-id,sections,story-template,summary,metadata"))
    build_stacks_request(request).execute!
    @top_stories = request.get_response("top")
    build_stacks(request)
    @cache_keys = request.cache_keys(soft: "all") rescue []
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

  def breaking_news
    breakingnews = Story.where({limit: 5, 'content-type': "breaking-news", 'story-group': "breaking-news", fields: "id,headline,slug,published-at,metadata,last-published-at"})
    @breakingnews = breakingnews.map {|story| story.to_h(@config) }
  end
end
