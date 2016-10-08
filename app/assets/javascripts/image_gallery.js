ImageGallery = {
  init: function() {
    $('.js-image-gallery').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: true,
      responsive: [{
        breakpoint: 768,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          arrows: true
        }
      }]
    });
  }
}

module.exports = ImageGallery;
