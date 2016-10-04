LocationOverlay = {
  init: function() {
    var $map = $('.js-location');
    var $cover = $('<div class="google-map-cover"></div>');
    $map.append($cover);

    $cover.on('click', function () {
      $cover.remove();
    });
  }
}

module.exports = LocationOverlay;
