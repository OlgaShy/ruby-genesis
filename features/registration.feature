Feature: Registration of new user
  Scenario: Successful registration
    Given I see login page is opened

    When I fill in register form and click on the submit button
    Then I became the register user
