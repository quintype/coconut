LocationOverlay = {
  init: function() {
    $(document).on('click', '.js-location', function() {
      $(this).find('iframe').css('pointer-events', 'auto');
    });

    $(document).on('mouseenter', '.js-location', function() {
      $(this).find('iframe').css('pointer-events', 'none');
    });

    $(document).on('mouseleave', '.js-location', function() {
      $(this).find('iframe').css('pointer-events', 'none');
    });
  }
}

module.exports = LocationOverlay;
