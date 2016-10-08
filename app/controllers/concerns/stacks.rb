module Stacks
  extend ActiveSupport::Concern

  def build_stacks_request(request)
    @config["layout"]["stacks"].each do |stack|
      request.add_request(stack["story-group"],
                          Story.bulk_stories_request(stack["story-group"])
                               .add_params(fields: "id,headline,slug,url,hero-image-s3-key,hero-image-metadata,first-published-at,last-published-at,alternative,published-at,author-name,author-id,sections,story-template,summary,metadata")
                               .add_params(limit: stack["max-stories"]))
    end
    request
  end

  def build_stacks(request)
    @stacks = @config["layout"]["stacks"].reduce([]) do |arr, stack|
      stories = request.get_response(stack["story-group"])
      arr << { heading: stack["heading"], stories: stories }.stringify_keys if !stories.empty?
      arr
    end
  end
end
