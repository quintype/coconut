var LazyYoutube = require('lazy-youtube');

YoutubeVideo = {
  init: function() {
    this.lazyLoadYoutubeVideo();
  },

  lazyLoadYoutubeVideo: function() {
    var youtubeVideoElements = document.querySelectorAll('.js-youtube-video');
    youtubeVideoElements.forEach(function(element) {
      LazyYoutube(element);
    });
  }
}

module.exports = YoutubeVideo;
