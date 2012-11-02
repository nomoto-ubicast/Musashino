jQuery(function () {
  jQuery("div.location-map").each(function () {
    var latitude = jQuery(this).children("span.latitude").text();
    var longitude = jQuery(this).children("span.longitude").text();
    musashino.createGoogleMap(this, latitude, longitude);
  });
});

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

  return map;
};
