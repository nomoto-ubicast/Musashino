package musashino.controller

import musashino.model.Location
import musashino.model.Note

class LocationController {

  def show() {
    def id = params["id"];
    if (!id) redirect(controller: 'home')
    return [location: Location.get(id)]
  }

  def addNote() {
    withForm {
      def locationId = params["location.id"]
      if (!locationId) redirect(controller: "home")

      def note = new Note(params)
      if (note.save()) {
        flash.message = "A note has been added"
        redirect(action: 'show', params: [id: locationId])
      }
      else {
        render(view: 'show', model: [
          location: Location.get(locationId),
          note: note
        ])
      }
    }.invalidToken {
      response.status = 405
    }
  }

  def deleteNote() {
    def id = params["id"];
    if (id) Note.get(id).delete();
    render ""
  }
}
