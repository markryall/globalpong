$(document).ready(function(){
  var startTime = new Date($("#startTime").text()),
      startPosition = new LatLon($("#startLat").text().parseDeg(),$("#startLon").text().parseDeg()),
      aimPosition = new LatLon($("#aimLat").text().parseDeg(),$("#aimLon").text().parseDeg()),
      speed = parseFloat($("#speed").text()),
      bearing = LatLon.bearing(startPosition.lat,startPosition.lon,aimPosition.lat,aimPosition.lon);

  function newPosition() {
    var now = new Date(),
        diffMillis = now.getTime() - startTime.getTime(),
        diffSeconds = diffMillis/1000,
        diffMinutes = diffSeconds/60,
        diffHours = diffMinutes/60,
        distanceTravelled = speed * diffHours;

    return startPosition.destPoint(bearing, distanceTravelled);
  }

  var marker,
      map,
      smallIcon = new GIcon(G_DEFAULT_ICON),
      initialPosition = newPosition(),
      gPosition = new GLatLng(initialPosition.lat,initialPosition.lon),
      svOverlay = new GStreetviewOverlay();

  function updateMarker() {
    var pos = newPosition();

    marker.setLatLng(new GLatLng(pos.lat,pos.lon));
    map.panTo(marker.getLatLng());
    $("#currentLat").text(pos.lat);
    $("#currentLon").text(pos.lon);
  }

  smallIcon.image = "http://maps.google.com/mapfiles/kml/pal4/icon57.png";
  smallIcon.shadow =  "http://maps.google.com/mapfiles/kml/pal4/icon57s.png";
  smallIcon.iconSize = new GSize(32, 32);
  smallIcon.shadowSize = new GSize(32, 32);

  map = new GMap2($("#map").get(0));
  map.setMapType(G_HYBRID_MAP);
  map.addControl(new GSmallMapControl());
  map.addControl(new GMapTypeControl());
  map.setCenter(gPosition, 8);
  marker = new GMarker(gPosition, { icon:smallIcon });
  map.addOverlay(marker);
  map.addOverlay(svOverlay);

  window.setInterval(updateMarker, 2000)
});