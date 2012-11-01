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
}
