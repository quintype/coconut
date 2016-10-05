// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require quintype-liquid
//= require liquid_helper
//= require jquery-2.1.4
//= require junk_remove_me
//= require slick_min
//= require_self

var _ = require("lodash");
var ImageGallery = require('image_gallery');
var LocationOverlay = require('location_overlay');
var YoutubeVideo = require('youtube_video');
var Preview = require('story_preview');

$(document).ready(function() {
  ImageGallery.init();
  LocationOverlay.init();
  YoutubeVideo.init();
  Preview.init();
});
