package musashino.model

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

  static getLatLngFromGoogleMaps(String address) {
    assert address != null


  }
}
