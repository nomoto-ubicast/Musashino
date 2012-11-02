package musashino.model

import groovy.json.JsonSlurper

class Location {

  String name
  String address

  String latitude
  String longitude

  Date dateCreated
  Date lastUpdated

  static hasMany = [notes: Note]

  static constraints = {
    name(blank: false)
    address(
      blank: false,
      validator: { val, obj ->
        obj.setLatLngFromGoogleMaps() ? null : "invalid"
      })
    latitude(nullable: true)
    longitude(nullable: true)
    dateCreated()
    lastUpdated()
  }

  String toString() {
    return this.name
  }

  static final String GOOGLE_MAP_URL_PREFIX = "http://maps.google.com/maps/api/geocode/json?"

  boolean setLatLngFromGoogleMaps() {
    if (!this.address) return false

    log.info("accessing to google map ...")
    def url = GOOGLE_MAP_URL_PREFIX + "address=" +
      URLEncoder.encode(this.address, "UTF-8") + "&sensor=false"
    log.info(url)

    def response = url.toURL().text
    log.debug(response)

    def json = new JsonSlurper().parseText(response)
    if (!json['results'][0]) {
      return false
    }

    this.latitude = json['results'][0]['geometry']['location']['lat']
    this.longitude = json['results'][0]['geometry']['location']['lng']
    return true
  }
}
