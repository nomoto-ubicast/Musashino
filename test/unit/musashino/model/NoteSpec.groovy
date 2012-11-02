package musashino.model

import grails.test.mixin.TestFor
import spock.lang.Specification

@TestFor(Note)
class NoteSpec extends Specification {

  def "content is required"() {
    when:
    def note = new Note()
    note.validate()
    then:
    note.hasErrors()
    note.errors.getFieldErrorCount("content") == 1
  }

  def "get the markdown content as html"() {
    when:
    def note = new Note()
    note.content = "this is **important**"
    def html = note.markdownToHtml()
    then:
    html == "<p>this is <strong>important</strong></p>"
  }
}
