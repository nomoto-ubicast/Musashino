package musashino.controller

import musashino.model.Location

class HomeController {

  def index() {
    [locations: locations()]
  }

  private static def locations() {
    return Location.list(sort: "lastUpdated", order: "desc")
  }

  def create() {
    withForm {
      def location = new Location(params)
      if (location.save()) {
        flash.message = "Registered - " + location.name
        redirect(action: 'index')
      }
      else {
        render(view: 'index', model: [
          location: location,
          locations: locations()
        ])
      }
    }.invalidToken {
      response.status = 405
    }
  }
}