Preview = function() {
  var template = quintypeLiquid.parse("{% include 'story/story' %}");

  return {
    init: function() {
      window.addEventListener('message', this.renderStoryPreviewPage);
    },

    renderStoryPreviewPage: function(event) {
      var story = event.data['story'];
      if(story) {
        var content = template.render({
          story: story,
          preview: true,
        });
        $('#js-story-preview').html(content);
      }
    }
  }
}

module.exports = Preview();
