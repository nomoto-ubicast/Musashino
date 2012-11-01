package musashino

import groovy.json.JsonSlurper

class ExperimentalTest extends GroovyTestCase {

  void testDummy() {
    assert 1 + 1 == 2
  }

  void testGoogleMap() {
    def url = "http://maps.google.com/maps/api/geocode/json?"
    url += "address=東京都千代田区永田町１丁目７−１&sensor=false"

    def response = url.toURL().text
    // println response

    def json = new JsonSlurper().parseText(response)
    if (!json['results'][0]) {
      println "couldn't get the location info"
      return
    }

    println "lat: " + json['results'][0]['geometry']['location']['lat']
    println "lng: " + json['results'][0]['geometry']['location']['lng']
  }
}
