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
}
