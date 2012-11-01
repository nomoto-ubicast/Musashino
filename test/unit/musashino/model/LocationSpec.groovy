package musashino.model

import grails.test.mixin.*
import org.junit.*
import spock.lang.Specification

@TestFor(Location)
class LocationSpec extends Specification {

  def "name is required"() {
    when:
      def location = new Location()
      location.validate()
    then:
      location.hasErrors()
      location.errors.getFieldErrorCount("name") == 1
  }

  def "get the latitude and longitude from the address"() {
    when:
      def location = new Location()
      location.address = "東京都千代田区永田町１丁目７−１"
      location.setLatLngFromGoogleMaps()
    then:
      location.latitude == "35.67589350"
      location.longitude == "139.74486590"
  }
}
