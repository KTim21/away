# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

show_map = ->
  map = L.map('map', {zoomControl: false, attributionControl: false}).setView([55, 11], 8)
  L.tileLayer('https://{s}.tiles.mapbox.com/v3/ktim.i8d5p969/{z}/{x}/{y}.png').addTo(map)
