Feature: Successful user login
  Scenario: Successful login
    Given I see start page is opened

    When I fill the login form
    Then I became logged in user
