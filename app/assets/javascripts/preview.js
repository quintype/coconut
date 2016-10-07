// Array.fill not supported in ie, if at all we want to increase browser support
function fillArray(value, len) {
  if (Array.fill) {
    return Array[len].fill(value);
  }

  var arr = [];
  for (var i = 0; i < len; i++) {
    arr.push(value);
  }
  return arr;
}

Preview = {
  init: function(callback) {
    window.addEventListener('message', function(event) {
      var story = event.data['story'];

      if (window.qtConfig.pageType === 'preview-story') {
        this.renderStoryPreviewPage(story);
      } else if (window.qtConfig.pageType === 'preview-home') {
        this.renderHomePreviewPage(story);
      }
      callback();
    }.bind(this));
  },

  renderStoryPreviewPage: function(story) {
    if(story) {
      var storyTemplate = quintypeLiquid.parse("{% include 'story/index' %}");
      var content = storyTemplate.render({
        story  : story,
        preview: true,
      });
      $('#js-story-preview').html(content);
    }
  },

  renderHomePreviewPage: function(story) {
    if (story) {
      var homeTemplate = quintypeLiquid.parse("{% include 'home/index' %}");
      var content = homeTemplate.render({
        preview: true,
        stories: fillArray(story, 10)
      });
    }
    $("#js-home-preview").html(content);
  }
}

module.exports = Preview;
