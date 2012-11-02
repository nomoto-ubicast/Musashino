package musashino.model

import org.pegdown.PegDownProcessor
import org.apache.commons.lang.StringEscapeUtils

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
      new PegDownProcessor().markdownToHtml(
        StringEscapeUtils.escapeHtml(this.content)) :
      this.content;
  }
}
