#encoding: utf-8
module FileHelper
  def partial_from_story_element(element)
    mapping = StoryElementMapping::TYPES
    mapping[element['subtype']].presence || mapping[element['type']]
  end
end
