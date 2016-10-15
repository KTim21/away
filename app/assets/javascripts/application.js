// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require leaflet
//= require leaflet-omnivore
//= require gpx
//= require togeojson
//= require bootstrap
//= require bootstrap-datepicker

showMap = function() {
  
  map = L.map('map', {
    zoomControl: false,
    attributionControl: false
  }).setView([55, 11], 8);
  
  L.tileLayer('https://api.mapbox.com/styles/v1/ktim/ciubls46j006k2io6zrcgiwfp/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3RpbSIsImEiOiJ4SW0zUTRzIn0.O2NZ8hw_wTvHTF7CeNJFdw').addTo(map);
  
  new L.Control.Zoom({
    position: 'topright'
  }).addTo(map);
  
  new L.control.scale({
    imperial: false,
    position: 'bottomright'
  }).addTo(map);
  
};

$(document).ready(function(){
  $('.date').datepicker({
    format: "yyyy-mm-dd",
    weekStart: 1,
    language: "de"
  });
});
