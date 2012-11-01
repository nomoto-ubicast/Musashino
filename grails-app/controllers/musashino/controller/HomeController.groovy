package musashino.controller

import musashino.model.Location

class HomeController {

  def index() {
    log.info("home/index ...")
  }

  def create() {
    withForm {
      def location = new Location(params)
      if (location.save()) {
        flash.message = "Registered - " + location.name
        redirect(action: 'index')
      }
      else {
        render(view: 'index', model: [location: location])
      }
    }.invalidToken {
      response.status = 405
    }
  }
}
