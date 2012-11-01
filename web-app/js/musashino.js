var musashino = {};

musashino.createGoogleMap = function (div, lat, lng) {
  var opts = {
    zoom:14,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(div, opts);
  var latlng = new google.maps.LatLng(lat, lng);
  map.setCenter(latlng);
  var marker = new google.maps.Marker({
    position:latlng,
    map:map
  });
};
