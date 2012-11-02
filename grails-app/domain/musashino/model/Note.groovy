package musashino.model

import org.pegdown.PegDownProcessor

class Note {

  static belongsTo = [location: Location]

  String content
  Date dateCreated
  Date lastUpdated

  static constraints = {
    content(blank: false)
    dateCreated()
    lastUpdated()
  }

  String markdownToHtml() {
    return this.content ?
      new PegDownProcessor().markdownToHtml(this.content) :
      this.content;
  }
}
