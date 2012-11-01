package musashino.model

import groovy.json.JsonSlurper

class Location {

  String name
  String address

  String latitude
  String longitude

  Date dateCreated
  Date lastUpdated

  static constraints = {
    name(blank: false)
    address(blank: false)
    latitude(nullable: true)
    longitude(nullable: true)
    dateCreated()
    lastUpdated()
  }

  String toString() {
    return this.name
  }

  def beforeInsert() {
    setLatLngFromGoogleMaps()
  }

  def beforeUpdate() {
    setLatLngFromGoogleMaps()
  }

  static final String GOOGLE_MAP_URL_PREFIX = "http://maps.google.com/maps/api/geocode/json?"

  void setLatLngFromGoogleMaps() {
    assert this.address != null

    log.info("Accessing to google map ...")
    def url = GOOGLE_MAP_URL_PREFIX + "address=" + this.address + "&sensor=false"
    def response = url.toURL().text
    def json = new JsonSlurper().parseText(response)
    if (!json['results'][0]) {
      log.warn("Couldn't get the location info: " + this.address)
      return
    }
    this.latitude = json['results'][0]['geometry']['location']['lat']
    this.longitude = json['results'][0]['geometry']['location']['lng']
  }
}
