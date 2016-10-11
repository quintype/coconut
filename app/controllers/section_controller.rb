class SectionController < ApplicationController
  include Stacks

  def index
    section = @config.sections.find {|section| section.slug == params[:section_slug]}
    raise ActionController::RoutingError.new('Not Found') if !section

    request = Quintype::API::Bulk.new
    request.add_request("top", Story.bulk_stories_request("top")
                                    .add_params(fields: "id,headline,slug,url,hero-image-s3-key,hero-image-metadata,first-published-at,last-published-at,alternative,published-at,author-name,author-id,sections,story-template,summary,metadata")
                                    .add_params("section-id": section.id))
    build_stacks_request(request).execute!
    @section_stories = request.get_response("top")
    build_stacks(request)
    @cache_keys = request.cache_keys(soft: "all", publisher_id: QtConfig.get.publisher_id) rescue nil
  end
end
