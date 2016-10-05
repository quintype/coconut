var quintype = require("quintype-js");
var _ = require("lodash");

Liquid.registerFilters({
  focusedImage: function(slug, metadata, aspect_ratio) {
    var image = new quintype.FocusedImage(slug, metadata);
    var aspectRatio = _.chain(aspect_ratio).split("x").map(function(x) { return parseInt(x); }).value();
    var opts = _.chain(arguments).drop(3).chunk(2).fromPairs().value();
    opts.fmt = 'pjpg'
    opts.auto = 'compress'
    return "//" + qtConfig.cdnImage + "/" + image.path(aspectRatio, opts);
  },

  partial_from_story_element: function(element) {
    var mapping = window.qtConfig.storyElementMapping;
    return mapping[element['subtype']] || mapping[element['type']]
  },

  base64_to_string: function(string) {
    return atob(string);
  }
});
