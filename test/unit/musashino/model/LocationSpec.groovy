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

  def "the latitude and longitude should be set before insert/update"() {
    when:
      def location = new Location()
      location.name = "国会議事堂"
      location.address = "東京都千代田区永田町１丁目７−１"
      location.save(flush: true)
    then:
      location.latitude == "35.67589350"
      location.longitude == "139.74486590"
  }

  def "invalid address should be a validation error"() {
    when:
      def location = new Location()
      location.name = "hogehoge"
      location.address = "でたらめ住所"
      def result = location.validate()
    then:
      result == false
      location.errors.getFieldErrorCount("address") == 1
      location.errors.getFieldError("address").code == "invalid"
  }
}
