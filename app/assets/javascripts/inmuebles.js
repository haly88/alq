function initMap() {
  var map = new google.maps.Map(document.getElementById('map_canvas'), {
    zoom: 17,
    center: {lat: -33.888103, lng: -60.570445}
  });
  var geocoder = new google.maps.Geocoder();
  var marker = new google.maps.Marker();
  geocodeAddress(geocoder, marker, map)

  document.getElementById('inmueble_direccion').addEventListener('change', function() {
    geocodeAddress(geocoder, marker, map);
  });
}

function geocodeAddress(geocoder, marker, map) {
  var address = document.getElementById('inmueble_direccion').value;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      marker.setMap(map);
      marker.setPosition(results[0].geometry.location);
      document.getElementById('inmueble_localidad').value = results[0].formatted_address;
    }
  });
}
