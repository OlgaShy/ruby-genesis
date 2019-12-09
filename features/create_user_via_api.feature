Feature: Creating a new User via API
  User should be able to create a new account in the system

  Scenario: Successful registration of new User via API
    When I send correct data for the new user registration
    Then I became a new registered via API user
