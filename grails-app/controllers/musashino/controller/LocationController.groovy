package musashino.controller

import musashino.model.Location

class LocationController {

  def show() {
    def id = params["id"];
    if (!id) redirect(controller: 'home')
    return [location: Location.get(id)]
  }
}
