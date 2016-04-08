Feature: Brigade has show view

  As a user
  I would like to see relevant information for a specific brigade
  So that I can quickly become up-to-date with what it is doing and decide to join.

  Background: Brigades in database

    Given the following users exist:
      | email |
      | test1@test.com |
      | test2@test.com |
      | test3@test.com |

    Given the following brigades exist:
      | location_id  | user_id | description                                         | calendar_url                                                                              | header_image_url                                                   |
      | 1            | 1       | Bienvenido a la brigada de Monterrey! Come with us. | https://www.google.com/calendar/ical/odyssey.charter%40odyssey.k12.de.us/public/basic.ics | http://www.dronestagr.am/wp-content/uploads/2014/10/cerrosilla.png |

  Scenario: visit brigade page
    pending
#    Given I am logged in as a user
#    When I visit the brigade page for Monterrey, Nuevo León
#    Then I should see "Monterrey"
#    And I should see "Bienvenido a la brigada de Monterrey! Come with us."
#    And I should see translation for brigades.show.follow
#    And I should see translation for brigades.show.next_event
#    And I should see translation for brigades.show.statistics
#    And I should see translation for brigades.show.members
#    And I should see translation for brigades.show.rsvp
#    And I should see translation for brigades.show.people_going
#    And I should see image with src http://www.dronestagr.am/wp-content/uploads/2014/10/cerrosilla.png
#    When I put hover over num-people-going
#    Then the people-going popup should appear