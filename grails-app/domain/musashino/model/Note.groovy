package musashino.model

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
}
